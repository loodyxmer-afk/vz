@echo off
:: --- WINDOW SETTINGS ---
mode con: cols=100 lines=30
color 0F
:: Force the script to run in the classic console host so 'mode' works
if "%~1" neq "conhost" (
    start "" conhost.exe "%~f0" conhost
    exit /b
)

:: Now the mode command will work
mode con: cols=65 lines=15

:: =====================================================================
:: MAIN MENU
:: =====================================================================
:MAIN_MENU
powershell -c "[console]::beep(2000,500)"
color 04
cls
echo =================================================================
echo               VIPER-ZED SYSTEM ADMIN MULTI-TOOL
echo =================================================================
echo.
echo  [1] System Tweaks ^& Custom Scripts...
echo  [2] Run System File Checker (SFC)
echo  [3] Flush DNS Cache ^& Reset Network
echo  [4] Check Disk Health (CHKDSK)
echo  [5] Update All Installed Software (Winget)
echo  [6] Generate Battery Health Report
echo  [7] Exit
echo.
echo =================================================================
set /p choice=" Select an option (1-7): "

if "%choice%"=="1" goto TWEAKS_MENU
if "%choice%"=="2" goto SFC
if "%choice%"=="3" goto NETWORK
if "%choice%"=="4" goto CHKDSK
if "%choice%"=="5" goto WINGET
if "%choice%"=="6" goto BATTERY
if "%choice%"=="7" goto EXIT

:: Catch invalid inputs
echo.
echo  [!] Invalid choice. Please select a number between 1 and 7.
timeout /t 2 >nul
goto MAIN_MENU

:: =====================================================================
:: SUB-MENU: TWEAKS & CUSTOM SCRIPTS
:: =====================================================================
:TWEAKS_MENU
powershell -c "[console]::beep(2000,500)"
color 07
cls
echo =================================================================
echo               SYSTEM TWEAKS ^& CUSTOM SCRIPTS
echo =================================================================
echo.
echo  [1] Run Windows Utility (Chris Titus Tech)
:: EDIT THE NAMES OF YOUR CUSTOM TOOLS BELOW
echo  [2] Run WINDOWS/OFFICE (ACTIVATION)
echo  [3] Download ADSK CRACK (DOWNLOADS)
echo  [4] Return to Main Menu
echo.
echo =================================================================
set /p tweak_choice=" Select an option (1-4): "

if "%tweak_choice%"=="1" goto TITUS_TWEAK
if "%tweak_choice%"=="2" goto CUSTOM_1
if "%tweak_choice%"=="3" goto CUSTOM_2
if "%tweak_choice%"=="4" goto MAIN_MENU

echo.
echo  [!] Invalid choice. Please select a valid number.
timeout /t 2 >nul
goto TWEAKS_MENU

:: =====================================================================
:: TWEAKS EXECUTION BLOCKS
:: =====================================================================
:TITUS_TWEAK
powershell -c "[console]::beep(2000,500)"
cls
echo  [*] Launching Windows Utility (Chris Titus Tech)...
echo  [*] Please wait for the PowerShell window to open.
powershell -Command "irm 'https://christitus.com/win' | iex"
echo.
pause
goto TWEAKS_MENU

:CUSTOM_1
powershell -c "[console]::beep(2000,500)"
cls
echo  [*] Running WINDOWS/OFFICE Tool ...

powershell -Command "irm 'https://get.activated.win' | iex"

echo.
pause
goto TWEAKS_MENU

:CUSTOM_2
powershell -c "[console]::beep(2000,500)"
cls
echo  [*] Downloading ADSK Tool ...

powershell -Command "Invoke-WebRequest -Uri 'https://tinyurl.com/VZADSKPJ' -OutFile \"$env:USERPROFILE\Downloads\ADSK.rar\""
start %userprofile%\Downloads
pause
goto TWEAKS_MENU

:: =====================================================================
:: MAIN MENU EXECUTION BLOCKS
:: =====================================================================
:SFC
powershell -c "[console]::beep(2000,500)"
cls
echo  [*] Running System File Checker...
echo  [*] Scanning for and restoring corrupted Windows system files.
sfc /scannow
echo.
pause
goto MAIN_MENU

:NETWORK
powershell -c "[console]::beep(2000,500)"
cls
echo  [*] Flushing DNS Cache and Resetting Network...
ipconfig /flushdns
netsh winsock reset
netsh int ip reset
echo  [*] Network reset complete. A system restart may be required.
echo.
pause
goto MAIN_MENU

:CHKDSK
powershell -c "[console]::beep(2000,500)"
cls
echo  [*] Checking Disk Health on C: Drive...
echo  [*] Note: If the drive is in use, this will schedule a scan for the next reboot.
chkdsk C: /f
echo.
pause
goto MAIN_MENU

:WINGET
powershell -c "[console]::beep(2000,500)"
cls
echo  [*] Updating installed software via Winget...
winget upgrade --all --include-unknown
echo.
pause
goto MAIN_MENU

:BATTERY
powershell -c "[console]::beep(2000,500)"
cls
echo  [*] Generating Battery Health Report...
powercfg /batteryreport /output "%USERPROFILE%\Desktop\battery_report.html"
echo  [*] Report saved to your Desktop as battery_report.html.
echo.
pause
goto MAIN_MENU

:EXIT
powershell -c "[console]::beep(2000,500)"
exit
