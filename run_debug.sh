#!/bin/bash

# declare Envrionment variables

echo "[Init Sequence 1] Declare Environment value"
#export VAR=/PATH/TO/INSERT

echo "[Init Sequence 2] Declare Library Path"
#export PATH=/PATH/TO/INSERT:$PATH

#export LD_LIBRARY_PATH=/PATH/TO/INSERT:$LD_LIBRARY_PATH

#EXT PATH SETTING
PATH_CURRENT=$(pwd)

EXEC_DEBUG_BINARY=$PATH_CURRENT/IpCamApp
# EXEC_DEBUG_BINARY_ARGS1=--sysinfo=/home/debian/config/GSPM_SysInfo.ini
# EXEC_DEBUG_BINARY_ARGS2=--devicemode=GSPM
# EXEC_DEBUG_BINARY_ARGS3=--verbose=DBG

EXEC_DEBUG_SERVER_PORT=localhost:2001


#EXECUTE
echo "[Init Sequence 3] Invoking Debugging Server.. (Address: $EXEC_SERVER_PORT Executing: $EXEC_DEBUG_BINARY)"
# gdbserver $EXEC_DEBUG_SERVER_PORT $EXEC_DEBUG_BINARY $EXEC_DEBUG_BINARY_ARGS1 $EXEC_DEBUG_BINARY_ARGS2 $EXEC_DEBUG_BINARY_ARGS3
gdbserver $EXEC_DEBUG_SERVER_PORT $EXEC_DEBUG_BINARY 
