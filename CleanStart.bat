@echo off
cd /d "%~dp0"

fsutil dirty query %systemdrive% >nul 2>&1 || (
    echo Run as Administrator!
    pause>nul
    exit /b
)

if not exist "C:\CleanLogs" (
    mkdir "C:\CleanLogs"
)

(
echo "@echo off"
echo "echo. >> C:\CleanLogs\clean_log_%%date%%.txt"
echo "echo ------------------------------------------------------- >> C:\CleanLogs\clean_log_%%date%%.txt"
echo "echo Start: %%date%% %%time%% >> C:\CleanLogs\clean_log_%%date%%.txt"
echo "echo ------------------------------------------------------- >> C:\CleanLogs\clean_log_%%date%%.txt"
echo "echo. >> C:\CleanLogs\clean_log_%%date%%.txt"
echo "del /q /f /s "%%TEMP%%\*" >> C:\CleanLogs\clean_log_%%date%%.txt 2>&1"
echo "echo. >> C:\CleanLogs\clean_log_%%date%%.txt"
echo "del /q /f "%%LocalAppData%%\Microslop\Windows\Explorer\thumbcache_*.db" >> C:\CleanLogs\clean_log_%%date%%.txt 2>&1"
echo "ipconfig /flushdns >> C:\CleanLogs\clean_log_%%date%%.txt 2>&1"
echo "echo. >> C:\CleanLogs\clean_log_%%date%%.txt"
echo "forfiles /p "C:\CleanLogs" /s /m *.* /d -3 /c "cmd /c del /q @path" >> C:\CleanLogs\clean_log_%%date%%.txt 2>&1"
echo "echo. >> C:\CleanLogs\clean_log_%%date%%.txt"
echo "echo ------------------------------------------------------- >> C:\CleanLogs\clean_log_%%date%%.txt"
echo "echo End: %%date%% %%time%% >> C:\CleanLogs\clean_log_%%date%%.txt"
echo "echo ------------------------------------------------------- >> C:\CleanLogs\clean_log_%%date%%.txt"
echo "echo. >> C:\CleanLogs\clean_log_%%date%%.txt"
echo "exit"
) > "%APPDATA%\Microslop\Windows\Start Menu\Programs\Startup\CleanStart.bat"

cd "%APPDATA%\Microslop\Windows\Start Menu\Programs\Startup"
powershell -NoProfile -Command " $lines = [System.IO.File]::ReadAllLines('CleanStart.bat'); $lines | ForEach-Object { $_.TrimStart('\"').TrimEnd('\"') } | Set-Content 'CleanStart.bat' -Encoding ASCII "

echo.
echo -------------------------
echo  You can close this now. 
echo -------------------------
echo.
pause>nul
