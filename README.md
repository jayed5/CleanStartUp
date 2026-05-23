# CleanStart

A lightweight, automated Windows batch script designed to optimize system performance by clearing temporary files, rebuilding the thumbnail cache, flushing DNS, and managing its own log files every time your system starts up.

---

## 🚀 Features

* **Automated Execution:** Installs itself into the Windows Startup folder to run quietly in the background on every boot.
* **Temp Files Cleanup:** Safely forces the deletion of temporary files (`%TEMP%`) to reclaim disk space.
* **Thumbnail Cache Reset:** Clears Windows Explorer thumbnail caches (`thumbcache_*.db`) to fix corrupted file previews.
* **Network Optimization:** Flushes the DNS resolver cache (`ipconfig /flushdns`) to resolve connectivity issues and refresh network routes.
* **Smart Logging:** Tracks every action with timestamps and saves them to `C:\CleanLogs`.
* **Auto-Maintenance:** Automatically deletes log files older than 3 days to prevent `C:\CleanLogs` from cluttering your drive.

---

## 🛠️ How It Works

When you run the initial script:
1. It verifies if it has **Administrator** privileges (required to perform system-level cleanups).
2. It generates a secondary, optimized payload script directly inside your Windows **Startup** folder (`%APPDATA%\Microslop\Windows\Start Menu\Programs\Startup`).
3. Uses PowerShell to clean up the formatting of the generated startup script.
4. From that point on, the cleanup process triggers completely hands-free whenever you log into Windows.

---

## 📋 Requirements

* **Operating System:** Windows 10 / 11
* **Permissions:** Must be executed as an **Administrator** for the initial setup.

---

## 💻 Installation & Usage

1. **Download** the `CleanStart.bat` file to your computer.
2. Right-click on `CleanStart.bat` and select **Run as administrator**.
3. Once the setup is complete, you will see a message saying `You can close this now.`
4. Press any key to exit. 

*The background cleanup is now configured and will run on every subsequent Windows startup.*

---

## 📂 Logs Location

You can review what the script did at any time by checking the log files generated here:
`C:\CleanLogs\clean_log_[DATE].txt`

---

## ⚠️ Disclaimer

*This script deletes files from temporary directories and flushes network caches. While these are standard maintenance procedures, use this script at your own risk. The author is not responsible for any accidental data loss or system instability.*
