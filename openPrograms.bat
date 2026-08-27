@echo off
chcp 65001 > nul
title Auto running programs

echo [*] Запускаем рабочее окружение...

start "" "%LocalAppData%\Programs\Microsoft VS Code\Code.exe"
start "" "%ProgramFiles%\Google\Chrome\Application\chrome.exe"
start "" "%LocalAppData%\Programs\Obsidian\Obsidian.exe"

echo [✔] Всё успешно запущено!

exit