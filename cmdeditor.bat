@echo off
title cmdwritefile
color a
rem cls
echo.
echo cmdwritefile
echo.
echo Usage: cmdwritefile filename.txt
echo To save press CTRL+C
type CON>%1
