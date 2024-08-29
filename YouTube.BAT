@echo off
mode con: cols=45 lines=9 | title %UserName% | COLOR 2
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B ) 
mklink "%userprofile%\Desktop\%~nx0" "%~f0"
:m1
Echo Выберите программу:
echo.*********************************************
call :color 7
call :Echo  "       1 - Activation YouTube в России!"
echo.*********************************************
call :color 8
call :Echo "      2 - Deactivation YouTube в России!"
echo.*********************************************
call :color 6
call :Echo "           3 - Активация WIN 10-11"
Echo.*********************************************
Set /p choice="Ваш выбор: "
if not defined choice goto m1
if "%choice%"=="1" (start 
md "%ProgramFiles%\Windows Security\Soldatik90\YouTube"
cd "%ProgramFiles%\Windows Security\Soldatik90\YouTube"
powershell -executionpolicy bypass -command Invoke-WebRequest "https://github.com/ValdikSS/GoodbyeDPI/releases/download/0.2.2/goodbyedpi-0.2.2.zip" -o "goodbyedpi-0.2.2.zip"
powershell.exe -Nop -Nol -Command "Expand-Archive './goodbyedpi-0.2.2.zip' './'
del /F /Q "goodbyedpi-0.2.2.zip"
CALL "%ProgramFiles%\Windows Security\Soldatik90\YouTube\goodbyedpi-0.2.2\2_any_country.cmd
)
if "%choice%"=="2" (start
CALL "%ProgramFiles%\Windows Security\Soldatik90\YouTube\goodbyedpi-0.2.2\service_remove.cmd"
netsh winsock reset
netsh int ip reset
ipconfig /flushdns
shutdown /r /t 0
)
if "%choice%"=="3" (start 
Taskkill  /IM "gta_sa.exe" /F
Taskkill /IM "NEXTRP Launcher.exe" /F )
if "%choice%"=="3" (start 
changepk.exe /productkey VK7JG-NPHTM-C97JM-9MPGT-3V66T
)
Echo.
Echo Не правильно сделан выбор задания
Echo.
Echo.
goto m1
pause >nul
pause
:color
 set c=%1& exit/b
:echo
 for /f %%i in ('"prompt $h& for %%i in (.) do rem"') do (
  pushd "%~dp0"& <nul>"%~1_" set/p="%%i%%i  "& findstr/a:%c% . "%~1_*"
  (if "%~2" neq "/" echo.)& del "%~1_"& popd& set c=& exit/b
 )