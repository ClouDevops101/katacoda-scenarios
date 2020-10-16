apt install openjdk-8-jre-headless -y
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
wget https://downloads.apache.org/cassandra/4.0-beta2/apache-cassandra-4.0-beta2-bin.tar.gz 
tar -xzf apache-cassandra-4.0-beta2-bin.tar.gz 
mv apache-cassandra-4.0-beta2 /usr/share/cassandra 
rm apache-cassandra-4.0-beta2-bin.tar.gz 
export PATH="$PATH:/usr/share/cassandra/bin:/usr/share/cassandra/tools/bin"
