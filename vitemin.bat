@echo off

REM made by: https://www.zacchello.site/

set /p name="package.json Name: "

REM "default" value in case of empty name
if "%name%"=="" set "name=my-vitemin-project"

REM cloning template
git clone https://github.com/zacchellodev/vitemin-template.git
move "vitemin-template" "%name%"
echo. >> ".\%name%\.gitignore"
echo "*.env" >> ".\%name%\.gitignore"

REM REMOVE .git FOLDER
rd /s /q "%name%\.git"

REM creating package.json
(
  echo {
  echo   "name": "%name%",
  echo   "private": true,
  echo   "version": "1.0.0",
  echo   "type": "module",
  echo   "scripts": {
  echo     "dev": "vite",
  echo     "build": "tsc && vite build",
  echo     "preview": "vite preview"
  echo   },
  echo   "dependencies": {
  echo     "react": "^18.2.0",
  echo     "react-dom": "^18.2.0"
  echo   },
  echo   "devDependencies": {
  echo     "@types/react": "^18.2.67",
  echo     "@types/react-dom": "^18.2.22",
  echo     "@vitejs/plugin-react-swc": "^3.6.0",
  echo     "tsc": "^2.0.4",
  echo     "typescript": "^5.4.2",
  echo     "vite": "^5.1.6"
  echo   }
  echo }
) > package.json
move "package.json" "%name%"

REM quickstart
cls

echo To get started:

echo cd %name%
echo yarn
echo yarn dev

echo.
