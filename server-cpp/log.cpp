#include "log.hpp"

using namespace detail;

template<>
void Log::print<boost::beast::error_code>(const boost::beast::error_code& t_val)
{
	std::cout << t_val.category().name() << " : " << t_val.message();
	get_stream() << t_val.category().name() << " : " << t_val.message();
}

void Log::print_endl()
{
	std::cout << std::endl;
	get_stream() << std::endl;
}

std::ostream& Log::get_stream()
{
	static std::ofstream file("asd.txt");

	return file;
}

void Log()
{
	detail::Log::print_endl();
	//log.print(head);
	//Log(tail...);
}