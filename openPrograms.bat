@echo off
chcp 65001 > nul
title Auto running programs

echo [*] Запускаем рабочее окружение...
echo.

set "VSCODE_PATH=%LocalAppData%\Programs\Microsoft VS Code\Code.exe"

@REM Проверяем , установлен ли VS code
if exist "%VSCODE_PATH%" (
  echo [+] VS Code найден, запускаем...
  start "" "%VSCODE_PATH%"
) else (
  echo [-] Ошибка: VS Code не установлен!
)

set "CHROME_PATH=%ProgramFiles%\Google\Chrome\Application\chrome.exe"

@REM Проверяем , установлен ли Chrome
if exist "%CHROME_PATH%" (
  echo [+] Chrome найден, загружаем...
  start "" "%CHROME_PATH%"
) else (
  echo [-] Ошибка: Chrome не установлен!
)

set "OBSIDIAN_PATH=%LocalAppData%\Programs\Obsidian\Obsidian.exe"

@REM Проверяем , установлен ли Obsidian
if exist "%OBSIDIAN_PATH%" (
  echo [+] Obsidian найден, запускаем...
  start "" "%OBSIDIAN_PATH%"
) else (
  echo [-] Ошибка: Obsidian не установлен!
)



echo [✔] Всё успешно запущено!

exit