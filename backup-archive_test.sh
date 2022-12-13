#!/bin/bash

# This backup script is used to archive ProxMox PVE backups into their own directories

BACKUP_PATH="/home/jonathan/backup_test/dump"
BACKUP_DATE="$(find "$BACKUP_PATH" -maxdepth 1 -type f -iname 'vzdump*' | awk -F '/' '{print $6}' | cut -d '-' -f 4 | sed 's/_/-/g' | sort | tail -n1)"
VM_FILES="$(find "$BACKUP_PATH" -maxdepth 1 -type f -iname '*qemu*')"
LXC_FILES="$(find "$BACKUP_PATH" -maxdepth 1 -type f -iname '*lxc*')"


# This will check if there is a parent directory for the current backups and then create a directory
if [[ -e "$BACKUP_PATH/monthly_backups.$BACKUP_DATE" ]]; then
    echo "This directory already exists..."

else

    mkdir $BACKUP_PATH/monthly_backups."$BACKUP_DATE"
    mkdir $BACKUP_PATH/monthly_backups."$BACKUP_DATE"/vm_backups."$BACKUP_DATE"
    mkdir $BACKUP_PATH/monthly_backups."$BACKUP_DATE"/lxc_backups."$BACKUP_DATE"
    echo "$LXC_FILES"
fi