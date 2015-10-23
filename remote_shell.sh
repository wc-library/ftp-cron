#!/bin/bash

CONFIG_FILE="$1"
source "$CONFIG_FILE"

lftp -u $remote_user,$remote_pass $remote_host
