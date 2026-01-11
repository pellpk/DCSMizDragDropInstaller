::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFBZVWB2RAE+1EbsQ5+n//NbWtkJMFPY3fc/QmvnOA+8D8wWsJ99tmzp5l9sVQhJbcXI=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZkoaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQIUCygUYQ2YfEK0FaEd5OT+/Yo=
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRmM8Vtwcj80
::Zh4grVQjdCyDJGyX8VAjFBZVWB2RAE+1EbsQ5+n//NajgX4wXfgWdpzP27iCJfJd713hFQ==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
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
