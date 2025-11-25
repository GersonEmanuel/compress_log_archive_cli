#!/bin/bash

if [ $# -ne 1 ]; then
	printf '%s\n%s\n' "Usage is incorrect" "Usage: $0 <log_directory>"
	exit 1
fi

LOG_DIR=$1
	LOG_ARCHIVE_DIR="/var/tmp/log_archives"
TIMESTAMP="$(date +%Y%m%d_%H%M%S)"
COMPRESSED_FILE_NAME="logs_archive_$TIMESTAMP.tar.gz"
LOG_FILE="logs.txt"

if [ ! -d "$ARCHIVE_DIR"]; then
	mdkir -p "$ARCHIVE_DIR"
fi

if sudo tar -czf "$ARCHIVE_DIR/$COMPRESSED_FILE_NAME" -C "$LOG_DIR" .; then
	echo "logs archived sucessfully"
	echo "[$(date +"%Y-%m-%d %H:%M:%S")] Archived logs to $ARCHIVE_DIR/$COMPRESSED_FILE_NAME" >> "$LOG_FILE"
else
	echo "error compressing logs"
	exit 1
fi
 

