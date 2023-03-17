#!/bin/sh

# Archive a directory with a timestamp

# Trim the trailing slash if present
DIR=${1%/}
OUTPUT="${DIR}_$(date +%Y%m%d_%H%M%S).tar.gz"

echo "Archiving $DIR to $OUTPUT"
tar -cvzf "$OUTPUT" "$DIR"
