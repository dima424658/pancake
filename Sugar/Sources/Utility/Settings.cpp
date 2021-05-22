#include "Settings.hpp"

using namespace Utility;

const Settings& Utility::Settings::Get()
{
	return GetInstanse();
}

Settings& Settings::GetInstanse()
{
	static Settings result;
	static bool init{ false };
	try
	{
		if (!init)
		{
			boost::property_tree::ptree json;
			boost::property_tree::read_json(json_path.data(), json);

			result = {
				{ // certificates
					json.get("certificates.certificate_path", ""),
					json.get("certificates.chain_path", ""),
					json.get("certificates.dh_param_path", ""),
					json.get("certificates.private_key_path", "")
				},
				{ // sql
					json.get("sql.host", "tcp://127.0.0.1:3309"),
					json.get("sql.catalog", "hakaton"),
					json.get("sql.user", "root"),
					json.get("sql.password", "root")
				},
				{ // local
					json.get("local.log_path", "log.txt"),
					json.get("local.url", "0.0.0.0"),
					json.get("local.host", "0.0.0.0"),
					json.get("local.port", 80U),
					json.get("local.threads", 8U)
				}
			};
		}
	}
	catch (std::exception e)
	{
		std::cout <<
			"Сервер: Ошибка чтения настроке json: " << json_path << std::endl <<
			"Исключение: " << e.what() << std::endl <<
			"Выход..." << std::endl;

		std::terminate();
	}

	return result;
}