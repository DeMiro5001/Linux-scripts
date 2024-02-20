
> source https://forum.yunohost.org/t/tuto-bloquer-les-requetes-selon-le-pays

*Check the Geoipupdate.md before continuing*
1. Login to your yunohost server, switch to root and cd to this folder


`cd /etc/yunohost/hooks.d/conf_regen`

If it doesn't exist, create it with mkdir.

2. Download the hook


`wget https://raw.githubusercontent.com/jarod5001/Linux-scripts/main/yunohost/18-nginx_geoip`

3. Edit the file


`sudo nano 18-nginx_geoip`


4. Change the country code, save and close and regenarate nginx config :


`yunohost tools regen-conf nginx --force `


5. Check it's working
