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
echo [2] Иницилизация Репозитория (Запускаем 1 раз)
echo [0] выход

choice /c 120 /n /m "Выберите действие (1-4, 0): "

if errorLevel 3 goto exit
if errorLevel 2 goto init
if errorLevel 1 goto quick_push


:quick_push
cls
echo === БЫСТРЫЙ PUSH ===

echo.
echo Отправить на GitHub? (Y/N)

choice /c YN /n /m "Ваш выбор: "

if errorLevel 2 goto menu

git add .
set /p MSG="Введите текст коммита: "

if "%MSG%"=="" set MSG="Auto-commit"

git commit -m "%MSG%"
git push
echo.
echo [!] Все успешно отправлено на GitHub
pause
goto menu

:init
cls
echo === Иницилизация Репозитория ===
git init
git branch -M main
set /p REPO_URL="Введите URL репозитория на GitHub: "
git remote add origin %REPO_URL%

echо.
echo Отправить первый коммит прямо сейчас? (Y/N)

choice /c YN /n /m "Ваш выбор: "

if errorLevel 2 goto menu

git add .
git commit -m "First Commit"
git push -u origin main
echo.
echo [!] Репозиторий успешно привязан!
pause
goto menu

:exit
cls
echo До свидания!
C:\Windows\System32\timeout.exe /t 2 > nul
exit
