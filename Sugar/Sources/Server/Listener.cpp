#include "Listener.hpp"

using namespace Server;

Listener::Listener(asio::io_context& t_ioc)
	: r_ioc{ t_ioc }, m_context{ ssl::context::tls }, m_acceptor{ t_ioc }
{
	LoadCertificates();
}

void Listener::Start(std::string_view t_address, unsigned short t_port)
{
	tcp::endpoint endpoint{ asio::ip::make_address(t_address), t_port };

	m_acceptor.open(endpoint.protocol());
	m_acceptor.set_option(asio::socket_base::reuse_address{ true });
	m_acceptor.bind(endpoint);
	m_acceptor.listen(asio::socket_base::max_listen_connections);

	DoAccept();
}

void Listener::Stop()
{
	if (m_acceptor.is_open())
		m_acceptor.close();
}

void Listener::SetCallback(RequestCallback t_callback) noexcept
{
	m_callback = std::move(t_callback);
}

void Listener::DoAccept() noexcept
{
	m_acceptor.async_accept(asio::make_strand(r_ioc), [&](beast::error_code ec, tcp::socket socket)
		{
			if (ec)
				return Utility::Log("Listener::DoAccept: ", ec);
			else
				std::make_shared<Server::Connection>(std::move(socket), m_context, m_callback)->Run();

			DoAccept();
		});
}

void Listener::LoadCertificates()
{
	m_context.set_password_callback(
		[](std::size_t, boost::asio::ssl::context_base::password_purpose)
		{
			return "not implemented";
		});

	m_context.set_options(
		boost::asio::ssl::context::default_workarounds |
		boost::asio::ssl::context::no_sslv2 |
		boost::asio::ssl::context::single_dh_use);
	try
	{
		m_context.use_certificate_file(Utility::Settings::Get().certificates.certificate_path, boost::asio::ssl::context::file_format::pem);
		m_context.use_certificate_chain_file(Utility::Settings::Get().certificates.chain_path);
		m_context.use_private_key_file(Utility::Settings::Get().certificates.private_key_path, boost::asio::ssl::context::file_format::pem);
		m_context.use_tmp_dh_file(Utility::Settings::Get().certificates.dh_param_path);
	}
	catch (const std::exception& e)
	{
		Utility::Log("Ошибка загрузки сертификатов: ", e.what());
	}
}