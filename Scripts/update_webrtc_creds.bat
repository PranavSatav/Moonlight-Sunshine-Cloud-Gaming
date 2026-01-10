@echo off
setlocal

REM ================================
REM Resolve paths dynamically
REM ================================

REM Folder where this BAT is located
set SCRIPT_DIR=%~dp0

REM Edited config.json (source)
set SRC_CONFIG=%SCRIPT_DIR%config.json

REM Root folder (one level up from scripts or wherever this BAT lives)
set ROOT=%SCRIPT_DIR%..

REM Destination config.json
set DEST_CONFIG=%ROOT%\MoonlightWeb\server\config.json

echo Copying config.json...
echo FROM: %SRC_CONFIG%
echo TO:   %DEST_CONFIG%
echo.

REM ================================
REM Ensure destination folder exists
REM ================================
if not exist "%ROOT%\MoonlightWeb\server" (
    echo ERROR: Destination folder not found:
    echo %ROOT%\MoonlightWeb\server
    pause
    exit /b 1
)

REM ================================
REM Copy file
REM ================================
copy /Y "%SRC_CONFIG%" "%DEST_CONFIG%" >nul

if errorlevel 1 (
    echo ❌ Copy failed
) else (
    echo ✅ config.json replaced successfully
)

pause
endlocal
