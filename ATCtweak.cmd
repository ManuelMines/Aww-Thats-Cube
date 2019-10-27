@echo off
CD >NUL

:: Writing Uninstall strings to the Registry -----------------------

SET KEY=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ATC

REG ADD %KEY% /v DisplayName /d "Aww That's Cube"

REG ADD %KEY% /v DisplayIcon /d "%CD%\Aww That's Cube.exe"

REG ADD %KEY% /v UninstallString /d ATCunins.cmd

REG ADD %KEY% /v Publisher /d "ManuelMines"

REG ADD %KEY% /v NoModify /t REG_DWORD /d 1

REG ADD %KEY% /v NoRepair /t REG_DWORD /d 1

:: Creating ATCunins.cmd -------------------------------------------

echo @echo off>%SystemRoot%\ATCunins.cmd

echo CD %CD%>>%SystemRoot%\ATCunins.cmd

echo :: Deleting ATC directory from Program Files>>%SystemRoot%\ATCunins.cmd
echo RD /S /Q "%CD%">>%SystemRoot%\ATCunins.cmd

echo :: Deleting ATC shortcut folder from Start Menu>>%SystemRoot%\ATCunins.cmd
echo RM "%%UserProfile%%\Start Menu\Programs\Aww That's Cube.lnk">>%SystemRoot%\ATCunins.cmd

echo :: Deleting ATC shortcut from Desktop>>%SystemRoot%\ATCunins.cmd
echo RM "%%UserProfile%%\Desktop\Aww That's Cube.lnk">>%SystemRoot%\ATCunins.cmd

echo :: Deleting ATC uninstall strings from the Registry>>%SystemRoot%\ATCunins.cmd
echo REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ATC /f>>%SystemRoot%\ATCunins.cmd

echo :: Deleting ATCunins.cmd (oh! that's me! OOPS!)>>%SystemRoot%\ATCunins.cmd
echo del %%0>>%SystemRoot%\ATCunins.cmd

:: Deleting ATCtweak.cmd (oh! that's me! OOPS!) --------------------

del %0