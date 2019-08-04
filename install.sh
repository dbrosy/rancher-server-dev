#!/bin/bash

clear

#echo "Installer: Certbot"
#sudo su -
#wget https://dl.eff.org/certbot-auto
#chmod a+x certbot-auto
#./certbot-auto
#mv certbot-auto /usr/local/bin
#certbot-auto --noninteractive --os-packages-only

#echo "Configure: Certbot"
# ./certbot-auto certonly
#exit
sudo - u
mkdir -p /etc/letsencrypt/live/rancher.lab
openssl req -x509 -out /etc/letsencrypt/live/rancher.lab/privkey.pem -keyout /etc/letsencrypt/live/rancher.lab/fullchain.pem   -newkey rsa:2048 -nodes -sha256   -subj '/CN=rancher-lab' -extensions EXT -config <( \ 
   printf "[dn]\nCN=rancher.lab\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:rancher.lab\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")
exit

echo -n "Enter your rancher password and press [ENTER]: "
read MYSQL_ROOT_PASSWORD
echo $MYSQL_ROOT_PASSWORD
if [[ ! -z $MYSQL_ROOT_PASSWORD ]]; then
  docker-compose up -d
else
  echo "Password not set, aborting docker-compose startup"
fi 
