sudo apt-get update
sudo apt-get upgrade
sudo apt-get install openjdk-11-jre-headless
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt install apt-transport-https
sudo apt update && sudo apt install elasticsearch
cd /opt
wget https://download.thehive-project.org/thehive-latest.zip
unzip thehive-latest.zip
ln -s thehive-3.5.2-1 thehive
sudo addgroup thehive
sudo adduser --system thehive
sudo cp /opt/thehive/package/thehive.service /usr/lib/systemd/system
sudo chown -R thehive:thehive /opt/thehive
sudo chgrp thehive /etc/thehive/application.conf
sudo chmod 640 /etc/thehive/application.conf
sudo systemctl enable thehive
sudo service thehive start
sudo mkdir /etc/thehive
(cat << _EOF_
# Secret key
# ~~~~~
# The secret key is used to secure cryptographics functions.
# If you deploy your application to several instances be sure to use the same key!
play.http.secret.key="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)"
_EOF_
) | sudo tee -a /etc/thehive/application.conf
bin/thehive -Dconfig.file=/etc/thehive/application.conf

