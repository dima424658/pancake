
#include "sugar.hpp"
#include "handler.hpp"
#include "settings.hpp"
#include "mysql/mysql.hpp"

static Handler g_handler;
static MySQL::Connection g_sql(Settings::Get().sql.host, Settings::Get().sql.user, Settings::Get().sql.password, Settings::Get().sql.catalog);

JNIEXPORT void JNICALL Java_JNISugar_Start(JNIEnv* env, jobject obj)
{
	try
	{
		auto _class{ env->GetObjectClass(obj) };
		auto _method{ env->GetMethodID(_class, "callback", "(Ljava/lang/String;)Ljava/lang/String;") };
		if (!_method)
			throw std::runtime_error{ "не нашел ф-цию callback" };
		
		g_handler.Start([env, _class, _method](std::string_view t_request)
			{
				jboolean isCopy;
				auto result{ static_cast<jstring>(env->CallStaticObjectMethod(_class, _method, env->NewStringUTF(t_request.data()))) };
				auto convertedValue{ env->GetStringUTFChars(result, &isCopy) };
				
				return std::string{ convertedValue, std::strlen(convertedValue) };
			});
	}
	catch (const std::exception& e)
	{
		env->ThrowNew(env->FindClass("java/lang/Exception"), e.what());
	}
}

JNIEXPORT void JNICALL Java_JNISugar_CreateUser(JNIEnv* env, jobject, jstring t_name, jstring t_lastName, jstring t_email, jstring t_phone)
{
	try
	{
		throw std::runtime_error{ "ti pidor" };
	}
	catch (const std::exception& e)
	{
		env->ThrowNew(env->FindClass("java/lang/Exception"), e.what());
	}
}

JNIEXPORT void JNICALL Java_JNISugar_CreateAdmin(JNIEnv* env, jobject, jstring t_name, jstring t_lastName, jstring t_email, jstring t_phone, jstring t_companyName)
{
	try
	{
		throw std::runtime_error{ "ti pidor" };
	}
	catch (const std::exception& e)
	{
		env->ThrowNew(env->FindClass("java/lang/Exception"), e.what());
	}
}
