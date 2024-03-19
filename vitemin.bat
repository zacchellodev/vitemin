@echo off
setlocal enabledelayedexpansion

REM get project name
if "%1" == "" (
  echo You forgot to type the name of your project, "vitemin NAME".
  exit /b
)

REM define project name
set "projName=%1"
set "gitRepo=https://github.com/xongs08/vitemin-win-template.git"

REM clone the repo to directory
git clone %gitRepo% "%projName%"

REM add "*.env" to .gitignore
echo. >> "%projName%\.gitignore"
echo *.env >> "%projName%\.gitignore"

REM editing package.json
set "tempFile=%temp%\tempfile50000.txt"
set "insertTxt1={"
set "insertTxt2=  "name:": "%name%","
set "packageJson=%name%\package.json"

echo %insertTxt1%>%tempFile%
echo %insertTxt2%>>%tempFile%
type %packageJson%>>%tempFile%
move /y %tempFile% %packageJson% >nul

REM deleting hidden ".git" folder
rd /s /q "%projName%\.git"

REM "printing" commands to install dependencies & other
cls

echo Project created
echo cd %projName%
echo yarn
echo yarn dev

echo.
