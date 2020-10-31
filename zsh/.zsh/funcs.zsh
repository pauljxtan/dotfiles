#######################################
# Mount a labelled partition if it is
# connected and not already mounted.
#
# Args:
#     The partition label
#     The mount path (if not given,
#         checks /etc/fstab)
#######################################
function try_mount() {
    local LABEL=$1
    local MOUNT_PATH=$2

    if [ -b /dev/disk/by-label/$LABEL ]
    then
        echo "$LABEL is connected"
        if [ $(grep -c $LABEL /proc/mounts) -eq 1 ]
        then
            echo "  $LABEL is already mounted"
        else
            echo "  Mounting $LABEL at $MOUNT_PATH..."
            sudo mount -L $LABEL $MOUNT_PATH
        fi
    else
        echo "$LABEL is not connected"
    fi
}

#######################################
# Change into a random directory at the
# given path (non-recursive).
#
# Args:
#     The base path
#######################################
function cd_random_subdir() {
    cd $(ls -d $1/* | shuf | head -n 1)
}

#######################################
# Search the command history via fzf
# and push the selection onto the
# editing buffer stack.
#
# Taken directly from:
# https://github.com/junegunn/fzf/wiki/
#        Examples#command-history
#######################################
fh() {
    print -z $( \
        ([ -n "$ZSH_NAME" ] && fc -l 1 || history) \
        | fzf +s --tac \
        | sed -E 's/ *[0-9]*\*? *//' \
        | sed -E 's/\\/\\\\/g' \
    )
}
