@echo off
javac -h build .\javaTamik\src\main\java\JNISugar.java
move .\build\JNISugar.h .\server-cpp\sugar.hpp
timeout /t 2 /nobreak >nul