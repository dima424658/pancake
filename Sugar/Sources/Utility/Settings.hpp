#pragma once

#include <iostream>
#include <string>
#include <string_view>
#include <vector>

#include <boost/property_tree/ptree.hpp>
#include <boost/property_tree/json_parser.hpp>

namespace Utility
{
	constexpr std::string_view json_path = "Assets\\Settings.json";

	struct Settings
	{
		struct
		{
			std::string certificate_path;
			std::string chain_path;
			std::string dh_param_path;
			std::string private_key_path;
		} certificates;

		struct
		{
			std::string host;
			std::string catalog;
			std::string user;
			std::string password;
		} sql;

		struct
		{
			std::string log_path;
			std::string url;
			std::string host;
			unsigned port;
			unsigned threads;
		} local;

		static const Settings& Get();

	private:
		static Settings& GetInstanse();
	};
}