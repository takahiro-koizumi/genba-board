@echo off
chcp 65001 > nul
cd /d "%~dp0"
title 現場配置ボード サーバ (localhost)
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0serve.ps1"
pause
