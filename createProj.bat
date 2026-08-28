@echo off
chcp 65001 > nul
title Генератор веб-проекта

echo.
echo ===========================
echo Создание НОВОГО ВЕБ-ПРОЕКТА
echo ===========================
echo.

set /p  PROJECT_NAME="Введите название проекта: "

if "%PROJECT_NAME%"=="" set "PROJECT_NAME=my-new-project"

@REM Проверяем, существует ли такая папка
if exist %PROJECT_NAME% (
  echo.
  echo [-] Ошибка: Папка "%PROJECT_NAME%" уже существует!
  echo.
  pause
  exit
)

echo.
echo [*] Создаём структуру проекта "%PROJECT_NAME%"...

@REM Создаем папку и переходим в нее
mkdir "%PROJECT_NAME%"
cd "%PROJECT_NAME%"

@REM Создаем подпапки проекта
mkdir css
mkdir js
mkdir img

echo [+] Папки (css, js, img) успешно созданы.

@REM Создаем и добавляем HTML, css, js  
(
echo ^<!DOCTYPE html^>
echo ^<html lang="ru"^>
echo ^<head^>
echo     ^<meta charset="UTF-8"^>
echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
echo     ^<title^>%PROJECT_NAME%^</title^>
echo     ^<link rel="stylesheet" href="css/style.css"^>
echo ^</head^>
echo ^<body^>
echo     ^<h1^>Проект %PROJECT_NAME% запущен!^</h1^>
echo     ^<script src="js/main.js"^>^</script^>
echo ^</body^>
echo ^</html^>
) > index.html

echo [+] Файл index.html сформирован

(
echo /* Основные стили проекта %PROJECT_NAME% */
echo * {
echo     box-sizing: border-box;
echo     margin: 0;
echo     padding: 0;
echo }
echo body {
echo     font-family: sans-serif;
echo     background-color: #f4f4f4;
echo     color: #333;
echo     padding: 20px;
echo }
) > css/style.css

echo // Инициализация JS проекта > js/main.js
echo console.log('Скрипт проекта %PROJECT_NAME% успешно подключен!'); >> js/main.js

echo [+] Файлы style.css и main.js созданы.

echo.
echo ==========================================
echo [✓] Проект "%PROJECT_NAME%" полностью готов!
echo ==========================================
echo.

@REM Запускаем
start "" code  .

exit