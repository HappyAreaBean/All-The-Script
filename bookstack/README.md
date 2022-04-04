# Bookstack Backup Script

A simple yet script to backup your Bookstack site!

## **Features**
* Backup files name are created with date
* Prompt for entering mysql info
* Auto cleanup useless files (e.g. The .sql file after created the archive)

## **How to download the script**
```
curl -O backup.sh https://raw.githubusercontent.com/HappyAreaBean/All-The-Script/master/bookstack/backup.sh
```
You may need to give the current user permission to execute script.
```bash
chmod u+x backup.sh
```


## **Usage**
1. You need to run this script in the **root folder** of bookstack installation
2. [Download the script](#how-to-download-the-script)
3. Run the script
```
./backup.sh <mysql database name>
```
> **For example:**
```
./backup.sh bookstack
```

---

If you have any question please let me know! :)