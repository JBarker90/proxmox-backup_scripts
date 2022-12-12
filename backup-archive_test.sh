#!/bin/bash

# This backup script is used to archive ProxMox PVE backups into their own directories

BACKUP_PATH="/home/jonathan/backup_test/dump"
BACKUP_DATE="$(find "$BACKUP_PATH" -maxdepth 1 -type f -iname 'vzdump*' | awk -F '/' '{print $6}' | cut -d '-' -f 4 | sed 's/_/-/g' | sort | tail -n1)"

echo "$BACKUP_DATE"