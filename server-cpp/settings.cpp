#include "settings.hpp"

template<typename T>
static std::vector<T> get_vector(boost::property_tree::ptree t_tree, boost::property_tree::path t_path)
{
	std::vector<T> result;
	result.reserve(t_tree.size());

	for (const auto& it : t_tree.get_child(t_path))
		result.push_back(it.second.get_value<T>());

	return result;
}

const Settings& Settings::Get()
{
	return GetInstanse();
}

Settings& Settings::GetInstanse()
{
	static Settings result;
	static bool init = false;
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

		std::exit(EXIT_FAILURE); // FIMXE так люди не делают...
	}

	return result;
}
