@echo off

set NAME_BINARY=IpCamApp
set PATH_DIR_BINARY=./build
set NAME_DEBUG_EXEC_SCRIPT=run_debug.sh
set PATH_DIR_SCRIPT=.
set PATH_DIR_DEPLOYMENT=~/app
set ADDR_TARGET=amylose@172.30.1.50

echo ######################################################
echo UAM App Uploader.....
echo [Uploader] Start time : %date% %time%
echo [Uploader] Connect : %ADDR_TARGET% 
echo *** Remote target message begins ***
echo [Remote] Uploading File(s)
scp %PATH_DIR_BINARY%/%NAME_BINARY% %PATH_DIR_SCRIPT%/%NAME_DEBUG_EXEC_SCRIPT% %ADDR_TARGET%:%PATH_DIR_DEPLOYMENT%
echo [Remote] Applying Uploaded File(s)
ssh %ADDR_TARGET% "chmod a+x %PATH_DIR_DEPLOYMENT%/%NAME_BINARY% %PATH_DIR_DEPLOYMENT%/%NAME_DEBUG_EXEC_SCRIPT%"
echo *** Remote target message end ***
echo [Uploader] Uploading finished
echo [Uploader] End time : %date% %time%
echo ######################################################
