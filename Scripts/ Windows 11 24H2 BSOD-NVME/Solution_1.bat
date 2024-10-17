@echo off
:: Script to fix Windows 11 24H2 BSODs related to Host Memory Buffer (HMB) allocation

echo Fixing Windows 11 24H2 BSOD issue related to certain SSDs by adjusting HMB allocation in the registry.
echo =====================================================

:: Check if running as Administrator
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo This script must be run as an administrator.
    echo Please right-click on the script and select 'Run as administrator'.
    pause
    exit /B
)

:: Navigate to the relevant registry path and adjust HMB allocation
reg add "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\StorPort" /v HmbAllocationPolicy /t REG_DWORD /d 2 /f

if %errorLevel% EQU 0 (
    echo Registry key successfully updated to reduce HMB allocation.
    echo Your system should now be more stable.
) else (
    echo Failed to update the registry. Please try again or make sure you have administrator privileges.
)

echo =====================================================
echo A system restart is recommended to apply these changes.
pause
