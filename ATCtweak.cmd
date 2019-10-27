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