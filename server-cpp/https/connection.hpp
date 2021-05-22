#pragma once

#include <boost/beast/core.hpp>
#include <boost/beast/http.hpp>
#include <boost/beast/ssl.hpp>
#include <boost/beast/version.hpp>

#include <boost/asio/dispatch.hpp>
#include <boost/asio/strand.hpp>

#include <boost/property_tree/ptree.hpp>
#include <boost/property_tree/json_parser.hpp>

#include <boost/config.hpp>

#include <memory>
#include <chrono>

#include "log.hpp"

// TODO: сделать TLS как опцию подключения

namespace beast = boost::beast;
namespace http = beast::http;
namespace asio = boost::asio;
namespace ssl = boost::asio::ssl;
using tcp = boost::asio::ip::tcp;

using RequestCallback = std::function<http::response<http::string_body>(http::request<http::string_body>)>;

namespace Server
{
	class Connection : public std::enable_shared_from_this<Connection>
	{
		static constexpr std::chrono::steady_clock::duration c_sslExpireTime{ std::chrono::seconds(10) };

	public:
		explicit Connection(tcp::socket&& t_socket, ssl::context& t_ctx, RequestCallback t_callback) noexcept;

		void Run() noexcept;

	private:
		void OnRun() noexcept;
		void OnHandshake(beast::error_code) noexcept;

		void Read() noexcept;
		void OnRead(beast::error_code, std::size_t bytes_transferred) noexcept;
		void OnWrite(bool close, beast::error_code, std::size_t bytes_transferred) noexcept;

		void Close() noexcept;

	private:
		beast::ssl_stream<beast::tcp_stream> m_stream;
		beast::flat_buffer m_buffer;

		http::request<http::string_body> m_request;
		http::response<http::string_body> m_response;

		RequestCallback m_callback;
	};
}