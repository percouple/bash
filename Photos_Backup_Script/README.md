# macOS Photos Library Backup Script

This script automatically backs up your macOS Photos Library file to a remote drive, based on updates to the Photos Library or a specified time interval.

## Features
- **Monitors changes**: The script checks for updates to the Photos Library by monitoring its modification time.
- **Periodic backups**: The script can be set to periodically back up the library based on a time interval (e.g., every hour).
- **Remote backup**: The script supports backing up to a remote drive using SCP or other protocols like NFS.
- **Error handling**: It provides basic error checking for successful backups and logging.

## Requirements
- **macOS**: This script is intended to run on macOS.
- **Remote Drive Access**: A mounted remote drive or accessible remote location (via SCP, NFS, or other protocols).
- **`rsync`** or `scp`: These utilities must be installed (typically included by default on macOS).

## Setup Instructions

### 1. Clone or Download the Script

```bash
git clone https://github.com/percouple/bash-practice.git
cd Photos-backup-script
```

### 2. Run './backup-photoslibrary.sh' in the terminal 

### 3. Follow the prompts for the required directories
