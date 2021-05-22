#pragma once

#include "https/listener.hpp"
#include "settings.hpp"

#include <boost/asio.hpp>
#include <boost/locale.hpp>
#include <boost/locale/utf.hpp>

#include <vector>
#include <thread>
#include <locale>
#include <functional>

class Handler
{
public:
	Handler();
	~Handler();

	void Start(std::function<std::string(std::string_view)> t_callback);
	void Stop();
	void Wait();

private:
	http::response<http::string_body> Process(http::request<http::string_body> t_request);

private:
	boost::asio::io_context m_ioc;
	std::vector<std::thread> m_threads;
	Server::Listener m_listener;
};
