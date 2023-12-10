
# source https://forum.yunohost.org/t/tuto-bloquer-les-requetes-selon-le-pays

Login to your yunohost server, switch to root and cd to this folder


`cd /etc/yunohost/hooks.d/conf_regen`

Download the hook


`wget https://raw.githubusercontent.com/jarod5001/Linux-scripts/main/yunohost/18-nginx_geoip`

Edit the file


`sudo nano 18-nginx_geoip`

Change the country code, save and close and regenarate nginx config :


`yunohost tools regen-conf nginx --force `

Check it's working
