
function get_mirror_options() {
    source "$1"

    local options=''
    if $sync_rem; then
        $options += ' --delete'
    fi

    if !$recursive; then
        $options += ' --no-recursion'
    fi

    if $sync_mod && !$sync_new; then
        $options += ' --only-existing';
    elif $sync_new && !$sync_mod; then
        $options += ' --only-missing'
    fi

    if $verbose; then
        $options += ' --verbose'
    fi

    if [[ "$__resultvar" ]]; then
        eval $__resultvar="$options"
    else
        echo "$options"
    fi
}
