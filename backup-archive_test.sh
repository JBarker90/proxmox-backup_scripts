#!/bin/bash

# This backup script is used to archive ProxMox PVE backups into their own directories

BACKUP_DATE="$(ls -lash /home/jonathan/backup_test/dump | grep 'vzdump' | awk -F '-' '{print $8, $9, $10}' | sed 's/_/-/g' | awk '{print $3}' | sort | tail -n1)"

echo "$BACKUP_DATE"