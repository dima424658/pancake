<p align="center">
	<img height="120px" src="https://raw.githubusercontent.com/dima424658/pancake/master/.github/icon.png" />
</p>

<h1 align="center">Pancake - Цифровой прорыв 2021</h1>

Кейс команды Провинция на конкурсе [Цифровой прорыв](https://leadersofdigital.ru).

## Описание

Проект разделен на три части:
 - Библиотека [server-cpp](server-cpp) отвечает за работу с базой данных MySQL и HTTPS в Java Native Interface
 - Сервер [javaTamik](javaTamik), написанный на Oracle Java, реализует собственный API для работы приложения
 - Клиент [YANAORental](YANAORental) для IOS

## Сборка из исходников
### [Готовые сборки](https://github.com/dima424658/pancake/releases)

### Зависимости [server-cpp](server-cpp)
 - [Boost](https://github.com/boostorg/boost) >= 1.68
 - [MySQL Connector/C++](https://github.com/mysql/mysql-connector-cpp) >= 8.0.19
 - [Java SE Development Kit](https://www.oracle.com/java/technologies/javase-jdk16-downloads.html) >= 16.0.0
 - [OpenSSL](https://slproweb.com/products/Win32OpenSSL.html) >= 1.1.1.k

Для Visual C++ 14.2 x64 скачать архив [dependencies-win64.7z]() и распаковать в папку dependencies
Для Arch Linux
```
# pacman -Syu openssl boost 
```
 Для компиляции server-cpp нео
Зависимости server-cpp: libcrypto >= 1.1, libssl >= 1.1, boost >= 1.60, mysql-connector-c++ >= 8.0.25, jdk >= 16.0.1
