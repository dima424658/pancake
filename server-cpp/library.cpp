/*// dllmain.cpp : Определяет точку входа для приложения DLL.

#include <iostream>
#include "library.hpp"

JNIEXPORT void JNICALL Java_JNITest_printHelloWorld
(JNIEnv*, jobject)
{
    std::cout << "Hello world!";
}*/

#include "mysql/mysql.hpp"

using namespace std;

int main(int argc, char* argv[])
{
    try
    {
        MySQL::Connection connection{ "tcp://192.168.1.76:3306", "root", "X2Ga56t4mI", "hakaton" };

        auto a{ connection.Query("select * from User;") };
        
        while (a->next())
        {

            cout << "\t... MySQL replies: ";
            /* Access column data by numeric offset, 1 is the first column */
            cout << a->getString(1) << a->getString(2) << a->getString(3) << a->getString(4) << endl;

        }
    }
    catch (std::exception& e)
    {
        std::cout << e.what();
    }
}