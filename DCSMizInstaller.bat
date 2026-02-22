
@echo off
setlocal EnableDelayedExpansion
title DCSMizInstaller
set "MissionFolder=%USERPROFILE%\Saved Games\DCS\Missions"
for /f "delims=" %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"

:: no file dragged
if "%~1"=="" (
    color 0C
    echo %ESC%[91mhey twin%ESC%[0m
    echo %ESC%[91myou need to drag and drop a .miz file onto this app.%ESC%[0m
    echo %ESC%[91mi recommend you put this .exe file onto your desktop%ESC%[0m
    echo.
    pause
    exit /b
)

:: quote path for protection against brackets
set "FullPath=%~1"
set "FileName=%~nx1"
set "FileExt=%~x1"

:: invalid file type
if /I not "!FileExt!"==".miz" (
    color 0C
    echo %ESC%[91merror: invalid file type%ESC%[0m
    echo %ESC%[91monly .miz files are supported%ESC%[0m
    echo.
    echo file received: !FileName!
    pause
    exit /b
)

:: missions folder doesnt exist
if not exist "!MissionFolder!" (
    color 0C
    echo %ESC%[91merror: missions folder not found%ESC%[0m
    echo %ESC%[91mexpected path:%ESC%[0m
    echo !MissionFolder!
    echo.
    pause
    exit /b
)

:: file overwrite check
if exist "!MissionFolder!\!FileName!" (
    color 0C
    echo %ESC%[91mwarning: mission already exists%ESC%[0m
    echo.
    echo !FileName!
    echo.
    choice /M "replace existing mission?"
    if errorlevel 2 (
        echo.
        echo install cancelled
        pause
        exit /b
    )
)

:: install mission
color 0A
copy "!FullPath!" "!MissionFolder!" /Y >nul
if errorlevel 1 (
    color 0C
    echo %ESC%[91merror: failed to copy file%ESC%[0m
    echo.
    pause
    exit /b
)

echo mission installed successfully^!
echo.
echo !FileName!
echo installed to:
echo !MissionFolder!
echo.

pause
