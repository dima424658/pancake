cmake_minimum_required(VERSION 3.16)

project(Sugar)

if(WIN32)
message(FATAL_ERROR "Для Windows используйте решение Visual Studio.")
endif()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/CMake)

set(PROJECT_SRC
${CMAKE_SOURCE_DIR}/Sources/Handler.cpp
${CMAKE_SOURCE_DIR}/Sources/Sugar.cpp
${CMAKE_SOURCE_DIR}/Sources/MySQL/MySQL.cpp
${CMAKE_SOURCE_DIR}/Sources/Server/Connection.cpp
${CMAKE_SOURCE_DIR}/Sources/Server/Listener.cpp
${CMAKE_SOURCE_DIR}/Sources/Utility/Log.cpp
${CMAKE_SOURCE_DIR}/Sources/Utility/Settings.cpp)

add_library(${PROJECT_NAME} SHARED ${PROJECT_SRC})
include_directories(${CMAKE_SOURCE_DIR}/Sources)

set(CMAKE_THREAD_PREFER_PTHREAD)
target_compile_options(${PROJECT_NAME} PUBLIC "-pthread")

find_package(OpenSSL REQUIRED)
find_package(JNI REQUIRED)
find_package(MySQL REQUIRED)
find_package(Threads REQUIRED)
find_package(Boost REQUIRED)

target_include_directories(${PROJECT_NAME} PUBLIC ${JAVA_INCLUDE_PATH} PUBLIC ${JAVA_INCLUDE_PATH2} PUBLIC ${MySQL_INCLUDE_DIR} PUBLIC ${Boost_INCLUDE_DIRS} PUBLIC ${OPENSSL_INCLUDE_DIR})
target_link_libraries(${PROJECT_NAME} ${JAVA_JVM_LIBRARY} ${MySQL_LIBRARY} ${Boost_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT} ${OPENSSL_LIBRARIES})