# Script to update geoip data 

Ssh to yunohost server, switch to root and run :


```
cd /etc/cron.weekly 

wget https://raw.githubusercontent.com/jarod5001/Linux-scripts/main/yunohost/Geoipupdate 

chmod +x /etc/cron.weekly/Geoipupdate
```
