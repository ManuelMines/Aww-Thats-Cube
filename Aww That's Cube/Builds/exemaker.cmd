@echo off
title Making Final EXE
goto MAKESFXCODE

:MAKESFXCODE
if exist sfx.settings ( rm sfx.settings )
echo ;The comment below contains SFX script commands>>sfx.settings
echo. >>sfx.settings
echo Path=Aww That's Cube>>sfx.settings
echo Setup=ATCtweak.cmd>>sfx.settings
echo Overwrite=1>>sfx.settings
echo Update=U>>sfx.settings
echo Title=Aww That's Cube>>sfx.settings
echo Shortcut=D, "Aww That's Cube.exe", , , "Aww That's Cube", >>sfx.settings
echo Shortcut=P, "Aww That's Cube.exe", , , "Aww That's Cube", >>sfx.settings
goto A

:A
set winrar="X:\Program Files\WinRAR\winrar.exe"
set rar="X:\Program Files\WinRAR\rar.exe"
%winrar% a -sfx -r -iicon9.ico game.exe *
%rar% c game.exe < sfx.settings
%rar% d game.exe sfx.settings
rm sfx.settings
del %0