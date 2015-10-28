#!/bin/bash

source ".config"

lftp -f "
open $remote_host
user $remote_user $remote_pass
$1
bye
"
