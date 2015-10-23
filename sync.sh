#!/bin/bash
source include/config.sh
CONFIG_FILE="$1"

options=`get_mirror_options $CONFIG_FILE`

lftp -f "
open $remote_host
user $remote_user $remote_pass
mirror -p $options $remote_dir $local_dir
bye
"
