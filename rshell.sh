#!/bin/bash
source ".config"
lftp -u $remote_user,$remote_pass $remote_host
