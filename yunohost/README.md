Some interesting hooks, fixes, additions, etc...

* [Gotify yunohost hooks](https://github.com/jarod5001/Linux-scripts/blob/main/yunohost/Gotify%20yunohost%20notifications.md)
* [Nextcloud apps updates and compatiblity check](https://github.com/DeMiro5001/Linux-scripts/blob/main/yunohost/nextcloud_updates_check)
  * Sends an email with details about nextcloud apps that the administrator should be aware of, ex :
    ```
    Nextcloud Health Report (Host: domain.ovh)
    ==========================================
    Current Version: 31.0.11 (PHP 8.3)
    Target Version : 32
    
     [!] APP UPDATES AVAILABLE
    --------------------------
    spreed new version available: 21.1.8
    forms new version available: 5.2.4
    calendar_resource_management new version available: 0.11.0
    collectives new version available: 3.5.0
    event_update_notification new version available: 2.8.0
    polls new version available: 8.6.3
    whiteboard new version available: 1.5.4
    contacts new version available: 7.3.12
    calendar new version available: 5.5.14
    
     [!] INCOMPATIBILITY WARNING (Target: v32)
    --------------------------------------------------
    Apps installed but NOT marked compatible with v32:
    
    dicomviewer
    files_mindmap
    sharepoint
    ```
* [Block countries via nftables](https://github.com/DeMiro5001/Linux-scripts/blob/main/yunohost/block_countries_yunohost.md)
* [Daily emails report](https://github.com/DeMiro5001/Linux-scripts/blob/main/yunohost/mail-report)
* [Yunohost apps updates notification](https://github.com/DeMiro5001/Linux-scripts/blob/main/yunohost/yunohost-updates-notifier)
