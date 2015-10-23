#!/bin/bash
source "$1"

options=''
if $sync_rem; then
    $options+=' --delete'
fi

if !$recursive; then
    $options+=' --no-recursion'
fi

if $sync_mod && !$sync_new; then
    $options+=' --only-existing'
elif $sync_new && !$sync_mod; then
    $options+=' --only-missing'
fi

if $verbose; then
    $options+=' --verbose'
fi

lftp -f "
open $remote_host
user $remote_user $remote_pass
lcd $remote_dir
mirror $options $remote_dir $local_dir
bye
"
