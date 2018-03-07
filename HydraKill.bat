@echo off

REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

echo HydraKill created by Xieshi, command line only

echo searching in memory: trying Xieshi'sHydraVir
taskkill/F /IM Xieshi'sHydraVir.exe
echo searching in memory: trying XieshisHydraVir
taskkill/F /IM XieshisHydraVir.exe
echo searching in memory: trying Xieshi'sHydraVir(1)
taskkill/F /IM Xieshi'sHydraVir(1).exe
echo searching in memory: trying XieshisHydraVir(1)
taskkill/F /IM XieshisHydraVir(1).exe

echo Task killed (if the virus did not quit, please contact zhangxieshi369@126.com)

reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /f

echo registry deleted, your computer should be clean

echo msgbox "Thank you for using HydraKill made by Xieshi! Please subscribe to PandoTech™ and Blackstone Gaming on YouTube" > %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs

pause