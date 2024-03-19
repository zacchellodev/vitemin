@echo off

REM made by: https://www.zacchello.site/

set /p name="package.json Name: "

REM "default" value in case of empty name
if "%name%"=="" set "name=my-vitemin-project"

REM cloning template and changing it name
git clone https://github.com/xongs08/vitemin-win-template.git
move vitemin-template %name%

REM add .env to gitignore
echo. >> .\%name%\.gitignore
echo *.env >> .\%name%\.gitignore

REM add package.json "name": "%name%"
setlocal EnableDelayedExpansion

set "tempFile=%temp%\tempfile.txt"
set "insertTxt1={"
set "insertText2=""name"": ""%name%"","

echo %insertTxt1%>%tempFile%
echo %insertTxt2%>>%tempFile%
type package.json>>%tempFile%
move /y %tempFile% package.json >nul

endlocal

REM REMOVE .git FOLDER
rd /s /q "%name%\.git"

REM quickstart
echo To get started:

echo cd %name%
echo yarn
echo yarn dev

echo.
