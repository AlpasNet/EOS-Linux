#!/bin/bash

OLD_USER="seijeeos"
NEW_USER="$1"

if [ -z "$NEW_USER" ]; then
    echo "Error : you must put your username."
    echo "Usage : $0 username"
    exit 1
fi

echo "Replacing '$OLD_USER' by '$NEW_USER' ..."

grep -RIl "$OLD_USER" "home" | while read -r file; do
    sed -i "s|$OLD_USER|$NEW_USER|g" "$file"
done
