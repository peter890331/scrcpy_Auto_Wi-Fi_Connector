@echo off
setlocal enabledelayedexpansion

rem 切換到 scrcpy.exe 與 此.bat 檔所在的資料夾
cd /d "%~dp0"

echo.
echo Checking for connected WiFi devices ...

rem 檢查 adb devices 中是否已經有 WiFi 設備
rem 執行 adb devices 並將結果存儲到變數中
set "output="
for /f "tokens=*" %%i in ('adb devices') do (
    set "line=%%i"
    rem 檢查 adb devices 中是否包含 "device"
    echo !line! | findstr /r "^[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*:[0-9]* device$" >nul
    if !errorlevel! equ 0 (
        set "output=!line!"
    )
)

rem 檢查 adb devices 中是否找到 WiFi 設備
if defined output (
    echo.
    echo Connected WiFi device has been found: !output!
    echo.
    set "DEVICE_IP=!output: =!"
    set "DEVICE_IP=!DEVICE_IP::5555=!"
    echo Try to connect via WiFi to !output! ...
    adb connect %DEVICE_IP%
    echo.

) else (
    echo.
    echo Connected WiFi device not found, 
    echo please connect phone to computer via USB first, and enable USB debug authorisation, 
    echo then please enter the IP address of the WiFi device manually.
    echo.
    set /p DEVICE_IP=Please enter the IP address of the WiFi device: 
    echo.
    adb tcpip 5555
    echo !DEVICE_IP! | findstr /c:":5555" >nul
    if !errorlevel! neq 0 (
        rem 如果 IP 地址中不包含 :5555，則添加
        set DEVICE_IP=!DEVICE_IP!:5555
    )
    adb connect !DEVICE_IP!
    echo.
    rem 动态倒计时
    set /a "countdown=9"
    :CountdownLoop
    rem 输出倒计时并让光标回到行首
    set "countdownDisplay="
    for /l %%a in (1,1,!countdown!) do set "countdownDisplay=!countdownDisplay!."
    set "countdownDisplay=Please disconnect phone to computer via USB within !countdown! seconds. [ Press Ctrl+C to stop ]"
    <nul set /p "=!countdownDisplay!                     "
    rem 延迟 1 秒
    timeout /t 1 >nul
    rem 清除输出的内容
    <nul set /p "="
    set /a "countdown-=1"
    rem 检查倒计时是否结束
    if !countdown! gtr 0 (
        goto :CountdownLoop
    ) else (
        rem 输出最后一次倒计时
        <nul set /p "="
        echo Please disconnect phone to computer via USB within 0 seconds. [ Press Ctrl+C to stop ]
    )
    echo.
)

echo Starting scrcpy ...
echo.
scrcpy -t -b2M -m800

pause