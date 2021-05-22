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

### [Готовые сборки](https://github.com/dima424658/pancake/releases)

## Сборка [server-cpp](server-cpp) из исходников

### Зависимости
 - [Boost](https://github.com/boostorg/boost) >= 1.68
 - [MySQL Connector/C++](https://github.com/mysql/mysql-connector-cpp) >= 8.0.19
 - [Java SE Development Kit](https://www.oracle.com/java/technologies/javase-jdk16-downloads.html) >= 16.0.0
 - [OpenSSL](https://slproweb.com/products/Win32OpenSSL.html) >= 1.1.1.k
 - [Visual C++ 2019 x64] >= 14.2x

### Компиляция
Скачать архив [dependencies-win64.7z](https://github.com/dima424658/pancake/releases/tag/dependencies) и распаковать в папку dependencies. После этого открыть [решенине](server-cpp/server.sln) в Visual Studio и собрать Release конфигрурацию

### Генерация сертефикатов
Для корректной работы HTTP Secure необходимо сгенериировать сертификаты с помошью [generate-certificates.bat](generate-certificates.bat).
