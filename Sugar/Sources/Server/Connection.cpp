#include "connection.hpp"

#include <iostream>

using namespace Server;

Connection::Connection(tcp::socket&& t_socket, ssl::context& t_ctx, RequestCallback t_callback) noexcept
	: m_stream{ std::move(t_socket), t_ctx }, m_callback{ t_callback } {}

void Connection::Run() noexcept
{
	asio::dispatch(m_stream.get_executor(),
		beast::bind_front_handler(&Connection::OnRun, shared_from_this()));
}

void Connection::OnRun() noexcept
{
	beast::get_lowest_layer(m_stream).expires_after(c_sslExpireTime);

	m_stream.async_handshake(ssl::stream_base::server,
		beast::bind_front_handler(&Connection::OnHandshake, shared_from_this()));
}

void Connection::OnHandshake(beast::error_code ec) noexcept
{
	if (ec)
		return Utility::Log("Connection::OnHandshake: ", ec);

	Read();
}

void Connection::Read() noexcept
{
	m_request = {};
	beast::get_lowest_layer(m_stream).expires_after(c_sslExpireTime);

	http::async_read(m_stream, m_buffer, m_request,
		beast::bind_front_handler(&Connection::OnRead, shared_from_this()));
}

void Connection::OnRead(beast::error_code ec, std::size_t bytes_transferred) noexcept
{
	boost::ignore_unused(bytes_transferred);

	if (ec == http::error::end_of_stream)
		return Close();

	if (ec && ec != beast::error::timeout)
		return Utility::Log("Connection::OnRead: ", ec);

	try
	{
		m_response = m_callback(std::move(m_request));
	}
	catch (std::exception e)
	{
		Utility::Log("Необработанное исключение Connection::OnRead: ", e.what());
	}

	m_response.content_length(m_response.body().size());
	m_response.prepare_payload();

	http::async_write(m_stream, m_response,
		beast::bind_front_handler(&Connection::OnWrite, shared_from_this(), m_response.need_eof()));
}

void Connection::OnWrite(bool close, beast::error_code ec, std::size_t bytes_transferred) noexcept
{
	boost::ignore_unused(bytes_transferred);

	if (ec || ec == beast::error::timeout)
		return Utility::Log("Connection::OnWrite: ", ec);

	if (close)
		return Close();
}

void Connection::Close() noexcept
{
	beast::get_lowest_layer(m_stream).expires_after(c_sslExpireTime);

	m_stream.async_shutdown([](beast::error_code ec)
		{
			if (ec)
				return Utility::Log("Connection::Close: ", ec);
		});
}