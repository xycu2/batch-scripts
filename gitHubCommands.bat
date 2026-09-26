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
echo [3] Создание ветки (Переходим в нее)
echo [4] Создание ветки (Остаемся в текущей)
echo [5] Удаление ветки (git branch -d)
echo [0] выход

choice /c 12340 /n /m "Выберите действие (1-4, 0): "

if errorLevel 5 goto exit
if errorLevel 4 goto create_branch_only
if errorLevel 3 goto create_and_switch
if errorLevel 2 goto init
if errorLevel 1 goto quick_push

:: Удаление ветки
:delete_branch
cls
echo === УДАЛЕНИЕ ВЕТКИ ===

echo.
echo Вы хотите удалить ветку? (Y/N)

choice /c YN /n /m "Ваш выбор: "

if errorLevel 2 goto menu

set branch_name=
set /p branch_name="Введите название ветки, которую хотите удалить: "

if "%branch_name%"=="" (
  echo [!] Название ветки не может быть пустым!
  pause
  goto menu
)

git branch -d "%branch_name%"
echo Ветка "%branch_name%" успешно удалена!

echo.
pause
goto menu


:: Создание ветки (остаемся в текущей)
:create_branch_only
cls
echo === СОЗДАНИЕ ВЕТКИ (ОСТАЕМСЯ В ТЕКУЩЕЙ) ===

echo.
echo Вы хотите создать ветку и остаться в текущей? (Y/N)

choice /c YN /n /m "Ваш выбор: "

if errorLevel 2 goto menu

set branch_name=
set /p branch_name="Введите название новой ветки: "

if "%branch_name%"=="" (
  echo [!] Название ветки не может быть пустым!
  pause
  goto menu
)

git branch "%branch_name%"

echo.
echo [!] Ветка "%branch_name%" успешно создана! Вы остались в текущей ветке.
echo Чтобы перейти на нее выполните: git switch "%branch_name%"
pause
goto menu

:: Создание ветки и сразу переходим в нее
:create_and_switch
cls
echo === СОЗДАНИЕ ВЕТКИ (ПЕРЕКЛЮЧАЕМСЯ НА НЕЕ) ===

echo.
echo Создать новую ветку и перейти в нее? (Y/N)

choice /c YN /n /m "Ваш выбор: "

if errorLevel 2 goto menu

set branch_name=
set /p branch_name="Введите название новой ветки: "

if "%branch_name%"=="" (
  echo [!] Имя ветки не может быть пустым!
  pause
  goto menu
)

git switch -c "%branch_name%"

echo.
echo [!] Вы успешно перешли в созданную ветку
pause 
goto menu

:: Отправка на GitHub(push)
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

:: Иницилизация репозитория(init) 
:init
cls
echo === Иницилизация Репозитория ===

echo.
echo Иницилизировать репозиторий(1 раз) (Y/N)?

choice /c YN /n /m "Ваш выбор: "

if errorLevel 2 goto menu

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

:: Выход
:exit
cls
echo До свидания!
C:\Windows\System32\timeout.exe /t 2 > nul
exit
