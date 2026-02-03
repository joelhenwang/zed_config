@echo off
setlocal

set REPO_CONFIG_DIR=.\config\zed
set REPO_LOCAL_DIR=.\local\zed

echo %REPO_CONFIG_DIR%
echo %REPO_LOCAL_DIR%

set ZED_CONFIG_DIR=%APPDATA%\Zed
set ZED_LOCAL_DIR=%LOCALAPPDATA%\Zed

robocopy "%ZED_CONFIG_DIR%" "%REPO_CONFIG_DIR%" /E /NFL /NDL /NJH /NJS /NP
robocopy "%ZED_LOCAL_DIR%" "%REPO_LOCAL_DIR%" /E /NFL /NDL /NJH /NJS /NP
