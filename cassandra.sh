echo "deb https://debian.cassandra.apache.org 41x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
curl https://downloads.apache.org/cassandra/KEYS | sudo apt-key add -


sudo apt-get update



sudo apt-key adv --keyserver pool.sks-keyservers.net --recv-key A278B781FE4B2BDA




 sudo apt-get install cassandra


