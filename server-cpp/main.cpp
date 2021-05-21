#include "handler.hpp"

int main(int argc, char* argv[])
{
#ifdef WIN32
	setlocale(LC_ALL, "");
#endif
	auto res = Settings::Get();

	Handler handle;

	handle.Start();
	handle.Wait();
}