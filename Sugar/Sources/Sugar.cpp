#include <boost/format.hpp>

#include "Sugar.hpp"
#include "Handler.hpp"
#include "Utility/Settings.hpp"
#include "MySQL/MySQL.hpp"

static Handler g_handler;
static MySQL::Connection g_sql(Utility::Settings::Get().sql.host, Utility::Settings::Get().sql.user, Utility::Settings::Get().sql.password, Utility::Settings::Get().sql.catalog);

static std::string toUTF(std::string_view str)
{
	boost::locale::generator g;
	g.locale_cache_enabled(true);

	return boost::locale::conv::to_utf<char>(str.data(), g(boost::locale::util::get_system_locale()));
}

static std::string toString(JNIEnv* env, jstring str)
{
	jboolean isCopy;
	auto convertedValue{ env->GetStringUTFChars(str, &isCopy) };

	std::string result{ convertedValue };
	if (isCopy == JNI_TRUE)
		env->ReleaseStringUTFChars(str, convertedValue);

	return result;
}

JNIEXPORT void JNICALL Java_JNISugar_Start(JNIEnv* env, jobject obj)
{
	try
	{
		auto _class{ env->GetObjectClass(obj) };
		auto _method{ env->GetStaticMethodID(_class, "callback", "(Ljava/lang/String;)Ljava/lang/String;") };

		if (!_method)
			throw std::runtime_error{ "не нашел ф-цию callback" };

		g_handler.Start([env, _class, _method](std::string_view t_request)
			{
				auto jresult{ static_cast<jstring>(env->CallStaticObjectMethod(_class, _method, env->NewStringUTF(t_request.data()))) };
				return toString(env, jresult);
			});
	}
	catch (const std::exception& e)
	{
		env->ThrowNew(env->FindClass("java/lang/Exception"), toUTF(e.what()).c_str());
	}
}

JNIEXPORT void JNICALL Java_JNISugar_Stop(JNIEnv* env, jobject obj)
{
	try
	{
		g_handler.Stop();
	}
	catch (const std::exception& e)
	{
		env->ThrowNew(env->FindClass("java/lang/Exception"), toUTF(e.what()).c_str());
	}
}

JNIEXPORT void JNICALL Java_JNISugar_Wait(JNIEnv* env, jobject obj)
{
	try
	{
		g_handler.Wait();
	}
	catch (const std::exception& e)
	{
		env->ThrowNew(env->FindClass("java/lang/Exception"), toUTF(e.what()).c_str());
	}
}

JNIEXPORT void JNICALL Java_JNISugar_CreateUser(JNIEnv* env, jobject, jstring t_name, jstring t_lastName, jstring t_email, jstring t_phone, jstring t_authKey)
{
	try
	{
		auto name{ toString(env, t_name) },
			lastName{ toString(env, t_lastName) },
			email{ toString(env, t_email) },
			phone{ toString(env, t_phone) },
			authKey{ toString(env, t_authKey) };

		auto query
		{
			boost::format{"insert User(FirstName, SurName, Phone, Mail, Mkey) value('%1%', '%2%', '%3%', '%4%', '%5%'); "}
			% name
			% lastName
			% phone
			% email
			% authKey
		};

		g_sql.Query(query.str());
	}
	catch (const std::exception& e)
	{
		env->ThrowNew(env->FindClass("java/lang/Exception"), toUTF(e.what()).c_str());
	}
}

JNIEXPORT void JNICALL Java_JNISugar_CreateAdmin(JNIEnv* env, jobject obj, jstring t_name, jstring t_lastName, jstring t_email, jstring t_phone, jstring t_authKey, jstring t_companyName)
{
	try
	{
		auto name{ toString(env, t_name) },
			lastName{ toString(env, t_lastName) },
			email{ toString(env, t_email) },
			phone{ toString(env, t_phone) },
			authKey{ toString(env, t_authKey) },
			companyName{ toString(env, t_companyName) };

		auto query
		{
			boost::format{"insert PointOwner(FirstName, SurName, CompanyName, Phone, Mail, Mkey) value('%1%', '%2%', '%3%', '%4%', '%5%'); "}
			% name
			% lastName
			% companyName
			% phone
			% email
			% authKey
		};

		g_sql.Query(query.str());
	}
	catch (const std::exception& e)
	{
		env->ThrowNew(env->FindClass("java/lang/Exception"), toUTF(e.what()).c_str());
	}
}

JNIEXPORT jboolean JNICALL Java_JNISugar_CheckUserPhone(JNIEnv* env, jobject obj, jstring t_phone)
{
	try
	{
		auto phone{ toString(env, t_phone) };
		auto query
		{
			boost::format{"SELECT Id FROM User WHERE Phone LIKE '%1%'; "}
			% phone
		};

		auto result{ g_sql.Query(query.str()) };

		return result->rowsCount() ? JNI_TRUE : JNI_FALSE;
	}
	catch (const std::exception& e)
	{
		env->ThrowNew(env->FindClass("java/lang/Exception"), toUTF(e.what()).c_str());
	}
}

JNIEXPORT jboolean JNICALL Java_JNISugar_CheckAdminPhone(JNIEnv* env, jobject obj, jstring t_phone)
{
	try
	{
		auto phone{ toString(env, t_phone) };
		auto query
		{
			boost::format{"SELECT Id FROM PointOwner WHERE Phone LIKE '%1%'; "}
			% phone
		};

		auto result{ g_sql.Query(query.str()) };

		return result->rowsCount() ? JNI_TRUE : JNI_FALSE;
	}
	catch (const std::exception& e)
	{
		env->ThrowNew(env->FindClass("java/lang/Exception"), toUTF(e.what()).c_str());
	}
}


JNIEXPORT void JNICALL Java_JNISugar_SetUserAuthKey(JNIEnv* env, jobject obj, jstring t_phone, jstring t_authKey)
{
	try
	{
		auto phone{ toString(env, t_phone) },
			authKey{ toString(env, t_authKey) };

		auto query
		{
			boost::format{"UPDATE User SET Mkey = '%2%' WHERE Phone = '%1%';"}
			% phone
			% authKey
		};

		auto result{ g_sql.Query(query.str()) };
	}
	catch (const std::exception& e)
	{
		env->ThrowNew(env->FindClass("java/lang/Exception"), toUTF(e.what()).c_str());
	}
}

JNIEXPORT void JNICALL Java_JNISugar_SetAdminAuthKey(JNIEnv* env, jobject obj, jstring t_phone, jstring t_authKey)
{
	try
	{
		auto phone{ toString(env, t_phone) },
			authKey{ toString(env, t_authKey) };

		auto query
		{
			boost::format{"UPDATE PointOwner SET Mkey = '%2%' WHERE Phone = '%1%';"}
			% phone
			% authKey
		};

		auto result{ g_sql.Query(query.str()) };
	}
	catch (const std::exception& e)
	{
		env->ThrowNew(env->FindClass("java/lang/Exception"), toUTF(e.what()).c_str());
	}
}

//env->NewStringUTF(t_request.data()))
JNIEXPORT jstring JNICALL Java_JNISugar_CheckUserAuthKey(JNIEnv* env, jobject obj, jstring t_authKey)
{
	try
	{
		auto authKey{ toString(env, t_authKey) };

		auto query
		{
			boost::format{"select Phone from User where Mkey like '%1%';"}
			% authKey
		};

		auto result{ g_sql.Query(query.str()) };

		if (result->rowsCount())
		{
			result->next();
			return env->NewStringUTF(result->getString("Phone").c_str());
		}
		else
			return env->NewStringUTF("not found");
	}
	catch (const std::exception& e)
	{
		env->ThrowNew(env->FindClass("java/lang/Exception"), toUTF(e.what()).c_str());
	}
}

JNIEXPORT jstring JNICALL Java_JNISugar_CheckAdminAuthKey(JNIEnv* env, jobject obj, jstring t_authKey)
{
	try
	{
		auto authKey{ toString(env, t_authKey) };
		auto query
		{
			boost::format{"select Phone from PointOwner where Mkey like '%1%';"}
			% authKey
		};

		auto result{ g_sql.Query(query.str()) };

		if (result->rowsCount())
		{
			result->next();
			return env->NewStringUTF(result->getString("Phone").c_str());
		}
		else
			return env->NewStringUTF("not found");
	}
	catch (const std::exception& e)
	{
		env->ThrowNew(env->FindClass("java/lang/Exception"), toUTF(e.what()).c_str());
	}
}

JNIEXPORT void JNICALL Java_JNISugar_SetBookingInfo(JNIEnv* env, jobject obj, jstring t_phone, jstring t_latitude,
	jstring t_longitude, jstring t_typeInventory, jstring t_timeBroni)
{
	try
	{
		auto phone{ toString(env, t_phone) },
			latitude{ toString(env, t_latitude) },
			longitude { toString(env, t_longitude) },
			typeInventory{ toString(env, t_typeInventory) },
			timeBroni{ toString(env, t_timeBroni) };
		auto query
		{
			boost::format{	"insert into RentHistory(UserId, RentalPointId, ItemId, RentStartTime)"
							"values((select Id from User where phone ='%1%'),"
							"(select Id from RentalPoint where Latitude='%2%' and Longitude='%3%'),"
							"(select Id from Item where ItemName ='%4%' and ItemStatus = 1),"
							"'%5%');"
							"update Item set ItemStatus=2 where Id=(select ItemId from RentHistory where RentStartTime='%5%');"}
			% phone
			% latitude
			% longitude
			% typeInventory
			% timeBroni
		};

		auto result{ g_sql.Query(query.str()) };
	}
	catch (const std::exception& e)
	{
		env->ThrowNew(env->FindClass("java/lang/Exception"), toUTF(e.what()).c_str());
	}
}