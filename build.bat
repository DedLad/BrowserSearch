@echo off

REM Build the solution
dotnet build BrowserSearch.sln /property:GenerateFullPaths=true /consoleloggerparameters:NoSummary /p:Configuration=Release /p:Platform="x64"

REM Define the source and destination paths
set "source=%cd%\BrowserSearch\bin\x64\Release\net8.0-windows"
set "destination=C:\Users\admin\AppData\Local\Microsoft\PowerToys\PowerToys Run\Plugins\BrowserSearch"

REM Check if the destination directory exists, if so, remove it
if exist "%destination%" (
    echo Removing existing directory...
    rmdir /s /q "%destination%"
)

REM Create the destination directory
mkdir "%destination%"

REM Move the built files to the destination directory
echo Moving directory...
move "%source%\*" "%destination%"

echo Move completed.
pause
