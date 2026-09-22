@echo off
chcp 65001 > nul
title GitHub Utils

:menu
cls
echo.
echo ========================
echo    GitHub Helpers
echo ========================
echo [1] Быстрый push (git add + commit + push)
echo [0] выход

choice /c 10 /n /m "Выберите действие (1-4, 0): "

if errorLevel 2 goto exit
if errorLevel 1 goto quick_push


:quick_push
cls
echo === БЫСТРЫЙ PUSH ===
echo git add
echo git commit -m
echo git push

@REM  Тут потом будут команды
echo.
echo [] Все успешно отправлено на GitHub
pause
goto menu

:exit
cls
echo До свидания!
timeout /t 2 > nul
pause
