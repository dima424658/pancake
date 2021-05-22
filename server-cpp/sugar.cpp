
#include "sugar.hpp"

JNIEXPORT void JNICALL Java_JNISugar_CreateUser(JNIEnv* env, jobject, jstring t_name, jstring t_lastName, jstring t_email, jstring t_phone)
{
	try
	{
		throw std::runtime_error{ "ti pidor" };
	}
	catch (const std::exception& e)
	{
		jclass ex = env->FindClass("java/lang/Exception");
		env->ThrowNew(ex, e.what());
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
		jclass ex = env->FindClass("java/lang/Exception");
		env->ThrowNew(ex, e.what());
	}
}
