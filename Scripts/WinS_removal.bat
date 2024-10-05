@echo off
GOTO EndComment
<!--*************************************************
Created by Badr-Eddine Goumidi
**************************************************-->
:EndComment
REM Script to disable S Mode on Windows

REM Check if the script is running in Advanced Startup Options
IF NOT EXIST "%WINDIR%\System32\Recovery\winre.wim" (
    echo This script must be run from Advanced Startup Options.
    echo Please boot into Advanced Startup Options and run this script again.
    pause
    exit /B
)

REM Check if Secure Boot is enabled
FOR /F "tokens=2 delims=:" %%A IN ('REG QUERY "HKLM\SYSTEM\CurrentControlSet\Control\SecureBoot\State" /v SecureBoot') DO (
    SET SecureBootState=%%A
)

REM Remove spaces from the SecureBootState variable
SET SecureBootState=%SecureBootState: =%

IF "%SecureBootState%" NEQ "0" (
    echo Secure Boot is currently enabled. 
    echo You can disable Secure Boot in the BIOS settings after running this script.
    echo Proceeding with S Mode removal...
)

REM Load the SYSTEM hive
REG LOAD HKLM\Offline C:\Windows\System32\Config\SYSTEM

REM Change the SkuPolicyRequired value to 0
REG ADD "HKLM\Offline\ControlSet001\Control\CI\Policy" /v SkuPolicyRequired /t REG_DWORD /d 0 /f

REM Unload the SYSTEM hive
REG UNLOAD HKLM\Offline

echo S Mode has been successfully removed. Please reboot your computer for the changes to take effect.

REM Reminder to disable Secure Boot if it was enabled
IF "%SecureBootState%" NEQ "0" (
    echo.
    echo IMPORTANT: Remember to disable Secure Boot in the BIOS settings.
)

pause
