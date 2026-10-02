@echo off
chcp 65001 > nul

for /f "tokens=*" %%i in ('git branch --show-current') do set CURRENT_BRANCH=%%i

if "%CURRENT_BRANCH%"=="main" (
  echo Вы находитесь в ветке main, переключитесь на рабочую ветку!
  pause
  goto menu
) else (
  echo Хотите отправить ветку %CURRENT_BRANCH% на GitHub? (Y/N)
  choice /c YN /n /m "Выберите действие: "

  if errorLevel 2 goto menu
  if errorLevel 1 (
    echo.
    set /p COMMIT_MSG="Введите сообщение для коммита: "

    echo [!] Индексируем и коммитим изменения...
    git add .
    git commit -m "%COMMIT_MSG%"

    echo [!] Отправляем ветку %CURRENT_BRANCH% на GitHub...
    git push -u origin %CURRENT_BRANCH%

    echo [!] Переходим в main и подтягиваем изменения...
    git checkout main
    git pull origin main

    echo [!] Вливаем ветку %CURRENT_BRANCH% в main...
    git merge %CURRENT_BRANCH%

    echo [!] Отправляем обновленный main на GitHub...
    git push origin main 

    pause
    goto menu
  )
)

:menu
echo.
echo menu завершено


@REM  echo Текущая ветка: %CURRENT_BRANCH%

@REM  set "changes="

@REM  for /f "tokens=*" %%i in ('git status --porcelain') do set "changes=%%i"

@REM  if "%changes%"=="" (
@REM    echo Все Хорошо
@REM  ) else (
@REM    echo Измененные файлы: %changes%
@REM  )
