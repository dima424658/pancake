#pragma once

#include "settings.hpp"
#include "connection.hpp"

class Listener : public std::enable_shared_from_this<Listener>
{
public:
	using RequestCallback = std::function<http::response<http::string_body>(http::request<http::string_body>)>;

	Listener(asio::io_context& t_ioc);

	void Start(std::string_view t_address, unsigned short t_port);
	void Stop();

	void SetCallback(RequestCallback) noexcept;

private:
	void DoAccept() noexcept;

	void LoadCertificates();

private:
	asio::io_context& r_ioc;
	ssl::context m_context;
	tcp::acceptor m_acceptor;

	RequestCallback m_callback;
};