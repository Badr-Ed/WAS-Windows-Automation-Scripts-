@echo off
:: Script to reverse the Windows 11 24H2 BSOD fix by restoring HMB allocation in the registry.

echo Reversing the Windows 11 24H2 BSOD fix by restoring Host Memory Buffer (HMB) allocation to default.
echo =====================================================

:: Check if running as Administrator
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo This script must be run as an administrator.
    echo Please right-click on the script and select 'Run as administrator'.
    pause
    exit /B
)

:: Navigate to the relevant registry path and restore HMB allocation to default (dynamic allocation)
reg add "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\StorPort" /v HmbAllocationPolicy /t REG_DWORD /d 1 /f

if %errorLevel% EQU 0 (
    echo Registry key successfully restored to dynamic HMB allocation (default).
) else (
    echo Failed to update the registry. Please try again or make sure you have administrator privileges.
)

echo =====================================================
echo A system restart is recommended to apply these changes.
pause
