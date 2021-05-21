#pragma once

#include <boost/format.hpp>
#include <boost/locale.hpp>

#include <boost/beast/core/error.hpp>

#include <fstream>

namespace detail
{
	class Log
	{
	public:
		template<typename T>
		static void print(const T& t_val)
		{
			std::cout << t_val;
			get_stream() << t_val;
		}

		template<>
		static void print<boost::beast::error_code>(const boost::beast::error_code& t_val);

		static void print_endl();

	private:
		static std::ostream& get_stream();
	};
};

void Log();

template<typename First, typename... Last>
void Log(First&& head, Last&& ...tail)
{
	detail::Log::print(head);
	Log(tail...);
}