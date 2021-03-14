@echo off
title writefile
color a
rem cls
echo.
echo writefile
echo.
echo Usage: writefile filename.txt
echo To save press CTRL+C
type CON>%1
