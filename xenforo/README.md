# Xenforo Backup Script

A simple yet script to backup your xenforo site!

## **Features**
* Backup files name are created with date
* Prompt for entering mysql info
* Auto cleanup useless files (e.g. The .sql file after created the archive)

## **How to download the script**
```
curl -O backup.sh https://raw.githubusercontent.com/HappyAreaBean/All-The-Script/master/xenforo/backup.sh
```
You may need to give the current user permission to execute script.
```bash
chmod u+x backup.sh
```


## **Usage**
```
./backup.sh <your xenforo folder> <mysql database name>
```
> **For example:**
```
./backup.sh forums xenforo
```

---

If you have any question please let me know! :)