#!/bin/bash
mkdir -p ~/opt/packages

cd ~/opt/packages

# Download JAVA 7 for Cassandra setup while accepting Oracle License
wget --no-cookies \
--no-check-certificate \
--header "Cookie: oraclelicense=accept-securebackup-cookie" \
"http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz"

tar -xzvf jdk-7u79-linux-x64.tar.gz
sudo mkdir /usr/lib/jvm
sudo mv jdk1.7.0_79 /usr/lib/jvm
sudo update-alternatives --install "/usr/bin/java" "java"     "/usr/lib/jvm/jdk1.7.0_79/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac"     "/usr/lib/jvm/jdk1.7.0_79/bin/javac" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws"     "/usr/lib/jvm/jdk1.7.0_79/bin/javaws" 1
java -version
javac -version
javaws -version

# Download Apache Cassandra 2.2.1 and Configure
wget http://mirrors.koehn.com/apache/cassandra/2.2.1/apache-cassandra-2.2.1-bin.tar.gz

# Untar & set symbolic link
gzip -dc apache-cassandra-2.2.1-bin.tar.gz | tar xf -
ln -s ~/opt/packages/apache-cassandra-2.2.1 ~/opt/cassandra

# Setup Cassandra directories for data, logs, caches
mkdir -p ~/opt/cassandra/data/data
mkdir -p ~/opt/cassandra/data/commitlog
mkdir -p ~/opt/cassandra/data/saved_caches
mkdir -p ~/opt/cassandra/logs

# Export Cassandra bin location to PATH
export PATH=$PATH:~/opt/cassandra/bin

~/opt/cassandra/bin/cassandra
