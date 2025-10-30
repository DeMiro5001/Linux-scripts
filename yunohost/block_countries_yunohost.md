## Start by cloning the following repo

```
git clone https://github.com/pvxe/nftables-geoip.git
cd nftables-geoip
```

## Check location.csv for the country codes you need to add (in both this command and 20-geoip-blocking.conf)

```
./nft_geoip.py --download -c cn,ru,ro,br,nl,ng,bd,ph,pk,th,hk,vn
```

## Del continents as they are not used and simply didn't work for me

```
sed -n '/^map continent_code/ q; p' geoip-def-all.nft > /etc/nftables.d/01-geoip-def-all.conf

cp geoip-ipv4-interesting.nft /etc/nftables.d/10-geoip-ipv4.conf
cp geoip-ipv6-interesting.nft /etc/nftables.d/11-geoip-ipv6.conf
```

## Fix (because table is not defined in the generated files, soooo)

```
# For IPv4 map
echo 'table inet filter {' | cat - /etc/nftables.d/10-geoip-ipv4.conf > temp && mv temp /etc/nftables.d/10-geoip-ipv4.conf
echo '}' >> /etc/nftables.d/10-geoip-ipv4.conf

# For IPv6 map
echo 'table inet filter {' | cat - /etc/nftables.d/11-geoip-ipv6.conf > temp && mv temp /etc/nftables.d/11-geoip-ipv6.conf
echo '}' >> /etc/nftables.d/11-geoip-ipv6.conf
```

## Add main config

```
nano /etc/nftables.d/20-geoip-blocking.conf
```

## Paste this and set the correct country codes

```yaml
table inet filter {
    chain input {
        # Map source IPs to marks based on GeoIP
        meta mark set ip saddr map @geoip4
        meta mark set ip6 saddr map @geoip6

        # Drop packets if mark matches one of the blocked countries
        meta mark { $CN, $RU, $RO, $BR, $NL, $NG, $BD, $PH, $PK, $TH, $HK, $VN } drop
    }
}
```

## Check it works

```
nft -f /etc/nftables.conf
# This will list all the rules (a very long list)
nft list ruleset
# Reload nftables
systemctl reload nftables
```

## Optional auto update, but I personally prefer manual updates 
```
nano update-geoip.sh
```

```bash
#!/bin/bash
cd /path/to/nftables-geoip
./nft_geoip.py --download -c cn,ru,ro,br,nl,ng,bd,ph,pk,th,hk,vn
sed -n '/^map continent_code/ q; p' geoip-def-all.nft > /etc/nftables.d/01-geoip-def-all.conf
rm /etc/nftables.d/10-geoip-ipv4.conf
rm /etc/nftables.d/11-geoip-ipv6.conf
cp geoip-ipv4-interesting.nft /etc/nftables.d/10-geoip-ipv4.conf
cp geoip-ipv6-interesting.nft /etc/nftables.d/11-geoip-ipv6.conf
echo 'table inet filter {' | cat - /etc/nftables.d/10-geoip-ipv4.conf > temp && mv temp /etc/nftables.d/10-geoip-ipv4.conf
echo '}' >> /etc/nftables.d/10-geoip-ipv4.conf
echo 'table inet filter {' | cat - /etc/nftables.d/11-geoip-ipv6.conf > temp && mv temp /etc/nftables.d/11-geoip-ipv6.conf
echo '}' >> /etc/nftables.d/11-geoip-ipv6.conf

# Delete old table
nft delete table geoip 2>/dev/null || true
nft -f /etc/nftables.conf
systemctl reload nftables
```


