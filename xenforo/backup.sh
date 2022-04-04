#!/bin/bash

# Assign varibles
FOLDER=$1
DATABASE_NAME=$2

# Get the date before doing anything to make the date more accurate
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

# Get current Epoch time
START_TIME=$(date +%s)

# Check if the $FOLDER string length is zero. If so, return message and exit.
if [ -z "$FOLDER" ]; then
    echo "Missing Argument 1: You need to enter your xenforo folder name."
    exit 0
fi

# Check if the $DATABASE_NAME string length is zero. If so, return message and exit.
if [ -z "$DATABASE_NAME" ]; then
    echo "Missing Argument 2: You need to specify the database name"
    exit 0
fi

# Check if $FOLDER is a folder.
if ! [ -d "$FOLDER" ]; then
    echo "$FOLDER is not a folder."
fi

# Ask for mysql username
DATABASE_USER=root
echo -n "Enter your mysql username: "
read -r DATABASE_USER

# New line
echo ""

# Ask for mysql passowrd (read have -s flag)
DATABASE_PASSWORD=123
echo -n "Enter your mysql password: "
read -r -s DATABASE_PASSWORD

# Assign Xenforo name and Mysql Database name
XENFORO_FILE="xenforo-$DATE.tgz"
DATABASE_FILE="$DATABASE_NAME.sql"

printf "\nDumping database: %s ...\n" "$DATABASE_NAME"

# Mysqldump command
mysqldump -u "$DATABASE_USER" -p "\"$DATABASE_PASSWORD\"" "$DATABASE_NAME" >"$DATABASE_FILE"

printf "\nDumping database completed.\n\n"

printf "\nCompressing folder %s's content...\n\n" "$FOLDER"

# Creating a archive with the Folder, and the database file.
tar -czvf "$XENFORO_FILE" "$FOLDER" "$DATABASE_FILE"

printf "\nCleanup...\n\n"

# Remove the database file
rm "$DATABASE_FILE"

# Assign the current Epoch time
FINISH_TIME=$(date +%s)

# Calculate how many milliseconds are used by subtract the FINISH_TIME and START_TIME
TOTAL_USED="$((FINISH_TIME - START_TIME))"

printf "Done! (Used %sms)\n" "$TOTAL_USED"
