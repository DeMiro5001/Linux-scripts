These hooks allow you to get notified on your phone or pc via gotify app. So you have to install this app (on any server). Don't forget to replace `__GOTIFYPATH__` by the gotify app path (domain.com/gotify) and `__TOKEN__` with a registered app on your gotify server. Make changes as you like to the messages.

1. Change user to root and change current working dir to yunohost hooks

```bash
# Change user to root and change current working dir to yunohost hooks
sudo -i
cd /etc/yunohost/hooks.d/
```

2. Get notified after adding a domain

```bash
# Add post_domain_add notification
mkdir post_domain_add
nano post_domain_add/01-post_domain_add
```

paste, save and exit

```bash
#!/bin/bash
source /usr/share/yunohost/helpers
current_date=$(date +"%d/%m/%Y %T")
notif="$current_date : Domain $1 added"
curl -X POST "https://__GOTIFYPATH__/message?token=__TOKEN__" -F "title=Yuno HomeServer - Domains" -F "message=$notif" > /dev/null 2>&1
```

3. Get notified after removing a domain

```bash
# Add post_domain_remove notification
mkdir post_domain_remove
nano post_domain_remove/01-post_domain_remove
```

paste, save and exit

```bash
#!/bin/bash
source /usr/share/yunohost/helpers
current_date=$(date +"%d/%m/%Y %T")
notif="$current_date : Domain $1 removed"
curl -X POST "https://__GOTIFYPATH__/message?token=__TOKEN__" -F "title=Yuno HomeServer - Domains" -F "message=$notif" > /dev/null 2>&1
```

4. Get notified after a certificate update

```bash
# Add post_cert_update notification
mkdir post_cert_update
nano post_cert_update/01-post_cert_update
```

paste, save and exit

```bash
#!/bin/bash
source /usr/share/yunohost/helpers
current_date=$(date +"%d/%m/%Y %T")
notif="$current_date : Certificate for domain $1 updated"
curl -X POST "https://__GOTIFYPATH__/message?token=__TOKEN__" -F "title=Yuno HomeServer - Certificates" -F "message=$notif" > /dev/null 2>&1
```

5. Get notified after a backup is finished

```bash
# Add backup notification
mkdir backup
nano backup/01-backup
```

paste, save and exit

```bash
#!/bin/bash
source /usr/share/yunohost/helpers
current_date=$(date +"%d/%m/%Y %T")
id=$YNH_APP_ID
current_version=$YNH_APP_MANIFEST_VERSION
notif="$current_date : Backup of App : $id $current_version successful"
curl -X POST "https://__GOTIFYPATH__/message?token=__TOKEN__" -F "title=Yuno HomeServer - App Backup" -F "message=$notif" > /dev/null 2>&1
```

6. Get notified after a restore is finished

```bash
# Add restore notification
mkdir restore
nano restore/01-restore
```

paste, save and exit

```bash
#!/bin/bash
source /usr/share/yunohost/helpers
current_date=$(date +"%d/%m/%Y %T")
id=$YNH_APP_ID
current_version=$YNH_APP_MANIFEST_VERSION
notif="$current_date : Restore of App : $id $current_version successful"
curl -X POST "https://__GOTIFYPATH__/message?token=__TOKEN__" -F "title=Yuno HomeServer - App Restore" -F "message=$notif" > /dev/null 2>&1
```

7. Get notified after an app is installed

```bash
# Add post_app_install notification
mkdir post_app_install
nano post_app_install/01-post_app_install
```

paste, save and exit

```bash
#!/bin/bash
source /usr/share/yunohost/helpers
current_date=$(date +"%d/%m/%Y %T")
id=$YNH_APP_ID
current_version=$YNH_APP_MANIFEST_VERSION
notif="$current_date : App : $id $current_version installed successfully"
curl -X POST "https://__GOTIFYPATH__/message?token=__TOKEN__" -F "title=Yuno HomeServer - App Install" -F "message=$notif" > /dev/null 2>&1
```

8. Get notified after an app is removed

```bash
# Add post_app_remove notification
mkdir post_app_remove
nano post_app_remove/01-post_app_remove
```

paste, save and exit

```bash
#!/bin/bash
source /usr/share/yunohost/helpers
current_date=$(date +"%d/%m/%Y %T")
id=$YNH_APP_ID
current_version=$YNH_APP_MANIFEST_VERSION
notif="$current_date : App : $id $current_version removed successfully"
curl -X POST "https://__GOTIFYPATH__/message?token=__TOKEN__" -F "title=Yuno HomeServer - App Remove" -F "message=$notif" > /dev/null 2>&1
```

9. Get notified after an app is updated

```bash
# Add post_app_upgrade notification
mkdir post_app_upgrade
nano post_app_upgrade/01-post_app_upgrade
```

paste, save and exit

```bash
#!/bin/bash
source /usr/share/yunohost/helpers
current_date=$(date +"%d/%m/%Y %T")
id=$YNH_APP_ID
current_version=$YNH_APP_CURRENT_VERSION
updated_version=$YNH_APP_MANIFEST_VERSION
notif="$current_date : App : $id updated from $current_version to $updated_version successfully"
curl -X POST "https://__GOTIFYPATH__/message?token=__TOKEN__" -F "title=Yuno HomeServer - App Update" -F "message=$notif" > /dev/null 2>&1
```

10. Get notified when a successful ssh connection is established

```bash
# Get notified when a successful ssh connection is established
nano /etc/profile.d/gotify_ssh_login.sh
```

paste, save and exit

```bash
curl -X POST "https://__GOTIFYPATH__/message?token=__TOKEN__" -F "title=Yuno Server - SSH login" -F "message=$USER connected from $SSH_CLIENT" > /dev/null 2>&1" > 
```
