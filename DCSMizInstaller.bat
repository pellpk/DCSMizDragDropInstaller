@echo off
setlocal EnableDelayedExpansion
title DCS Miz DragAndDrop installer

set MissionFolder=%USERPROFILE%\Saved Games\DCS\Missions

for /f "delims=" %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"

REM no file dragged
if "%~1"=="" (
    color 0C
    echo %ESC%mhey twin%ESC%
    echo %ESC%myou need to drag and drop a .miz file onto this app.%ESC%
    echo %ESC%mi recommend you put this .exe file onto your desktop%ESC%
    echo.
    pause
    exit /b
)

REM invalid file type
if /I not "%~x1"==".miz" (
    color 0C
    echo %ESC%[91merror: invalid file type%ESC%[0m
    echo %ESC%[91monly .miz files are supported%ESC%[0m
    echo.
    echo file received: %~nx1
    pause
    exit /b
)

REM missions folder doesnt exist
if not exist "%MissionFolder%" (
    color 0C
    echo %ESC%[91merror: missions folder not found%ESC%[0m
    echo %ESC%[91mexpected path:%ESC%[0m
    echo %MissionFolder%
    echo.
    pause
    exit /b
)


REM file overwrite check
if exist "%MissionFolder%\%~nx1" (
    color 0C
    echo %ESC%[91mwarning: mission already exists%ESC%[0m
    echo.
    echo %~nx1
    echo.
    choice /M "replace existing mission?"
    if errorlevel 2 (
        echo.
        echo install cancelled
        pause
        exit /b
    )
)

REM install mission
color 0A

copy "%~1" "%MissionFolder%" /Y >nul

echo mission installed successfully
echo.
echo %~nx1
echo installed to:
echo %MissionFolder%
pause

