#!/bin/bash
CONFIG_FILE = "$1"
source $CONFIG_FILE

lftp -f "
open $remote_host
user $remote_user $remote_pass
cd $remote_dir
nlist
bye
"
