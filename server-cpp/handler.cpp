#include "handler.hpp"

Handler::Handler()
	: m_ioc{ Settings::Get().local.threads },
	m_listener{ m_ioc }
{
	m_threads.reserve(Settings::Get().local.threads);
}

Handler::~Handler()
{
	Stop();
}

void Handler::Start()
{
	m_listener.SetCallback(std::bind(&Handler::Process, this, std::placeholders::_1));
	m_listener.Start(Settings::Get().local.host, Settings::Get().local.port);

	for (auto i = Settings::Get().local.threads; i > 0; --i)
		m_threads.emplace_back([&]() // FIXME: ��������� ������
			{
				m_ioc.run();
			});
}

void Handler::Stop()
{
	m_listener.Stop();
	m_ioc.stop();

	for (auto& thread : m_threads)
		thread.join();

	m_threads.clear();
}

void Handler::Wait()
{
	for (auto& thread : m_threads)
		thread.join();
}


http::response<http::string_body> Handler::Process(http::request<http::string_body> t_request)
{
	http::response<http::string_body> result;
	result.result(http::status::ok);
	result.body() = "asd";
	result.prepare_payload();

	return result;
}