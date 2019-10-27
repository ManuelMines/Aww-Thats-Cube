::::::::::::::::::::::::::::::::::::::::::::
:: Automatically check & get admin rights V2
::::::::::::::::::::::::::::::::::::::::::::
@echo off
CLS
ECHO.
ECHO =============================
ECHO Running Admin shell
ECHO =============================

:init
setlocal DisableDelayedExpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
ECHO.
ECHO **************************************
ECHO Invoking UAC for Privilege Escalation
ECHO **************************************

ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /B

:gotPrivileges
setlocal & pushd .
cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

::::::::::::::::::::::::::::
::START

@echo off
CD >NUL

:: Writing Uninstall strings to the Registry -----------------------

SET KEY=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ATC

REG ADD %KEY% /v DisplayName /d "Aww That's Cube" /f

REG ADD %KEY% /v DisplayIcon /d "%CD%\Aww That's Cube.exe" /f

REG ADD %KEY% /v UninstallString /d %UserProfile%\AppData\Roaming\ATCunins.cmd /f

REG ADD %KEY% /v Publisher /d "ManuelMines" /f

REG ADD %KEY% /v NoModify /t REG_DWORD /d 1 /f

REG ADD %KEY% /v NoRepair /t REG_DWORD /d 1 /f

:: Creating ATCunins.cmd -------------------------------------------

echo @echo off>%UserProfile%\AppData\Roaming\ATCunins.cmd

echo CD %CD%>>%UserProfile%\AppData\Roaming\ATCunins.cmd

echo :: Deleting ATC directory from Program Files>>%UserProfile%\AppData\Roaming\ATCunins.cmd
echo RD /S /Q "%CD%">>%UserProfile%\AppData\Roaming\ATCunins.cmd

echo :: Deleting ATC shortcut folder from Start Menu>>%UserProfile%\AppData\Roaming\ATCunins.cmd
echo RM "%%UserProfile%%\Start Menu\Programs\Aww That's Cube.lnk">>%UserProfile%\AppData\Roaming\ATCunins.cmd

echo :: Deleting ATC shortcut from Desktop>>%UserProfile%\AppData\Roaming\ATCunins.cmd
echo RM "%%UserProfile%%\Desktop\Aww That's Cube.lnk">>%UserProfile%\AppData\Roaming\ATCunins.cmd

echo :: Deleting ATC uninstall strings from the Registry>>%UserProfile%\AppData\Roaming\ATCunins.cmd
echo REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ATC /f>>%UserProfile%\AppData\Roaming\ATCunins.cmd

echo :: Deleting ATCunins.cmd (oh! that's me! OOPS!)>>%UserProfile%\AppData\Roaming\ATCunins.cmd
echo del %%0>>%UserProfile%\AppData\Roaming\ATCunins.cmd

:: Deleting ATCtweak.cmd (oh! that's me! OOPS!) --------------------

del %0