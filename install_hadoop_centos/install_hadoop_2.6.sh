# This script assumes, you have a centos installed and can access root account. 
PWD=`pwd`

# install Java
yum install java

# check java versionn
java -version

# add user hadoop
adduser hadoop 

# update password for the user hadoop 
echo hadoop:hadoop | chpasswd

# download and renames hadoop 
rm -rf /opt/hadoop*

cd ~

if test -e "hadoop-2.6.0.tar.gz";then

tar xzf hadoop-2.6.0.tar.gz
mv hadoop-2.6.0 /opt/hadoop
chmod 777 /opt/hadoop

else 

wget http://apache.claz.org/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz
tar xzf hadoop-2.6.0.tar.gz
mv hadoop-2.6.0 /opt/hadoop
chmod 777 /opt/hadoop

fi




# updates all path
cat /tmp/install_hadoop/install_hadoop_centos/bashrc.sh >> /home/hadoop/.bashrc


# this export for hadoop user 
#export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk.x86_64/

# Updates all configuration files

cat /tmp/install_hadoop/install_hadoop_centos/core-site.xml > /opt/hadoop/etc/hadoop/core-site.xml
cat /tmp/install_hadoop/install_hadoop_centos/hdfs-site.xml > /opt/hadoop/etc/hadoop/hdfs-site.xml
cat /tmp/install_hadoop/install_hadoop_centos/mapred-site.xml > /opt/hadoop/etc/hadoop/mapred-site.xml
cat /tmp/install_hadoop/install_hadoop_centos/yarn-site.xml > /opt/hadoop/etc/hadoop/yarn-site.xml

# this export for root user 
export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk.x86_64/
source ~/.bashrc



su -l hadoop -c '
echo "#####################################"
echo "current user Name is "
whoami
echo "#####################################"

cd ~
source ~/.bashrc

chmod 700 ~/.ssh/*
rm -rf ~/.ssh/*
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
echo "NoHostAuthenticationForLocalhost yes" > ~/.ssh/config
chmod 0600 ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/config

#ssh localhost

# Fromat namenode
cd /opt/hadoop/bin/
./hdfs namenode -format


cd /opt/hadoop/sbin 

# start yarn
./start-yarn.sh	


sleep 10

# Start Hadoop 
./start-dfs.sh

sleep 10

# make testing hdfs directory
/opt/hadoop/bin/hdfs dfs -mkdir -p /user/hadoop


' # end of hadoop user acitivity 


adrs=`hostname -I`
#/usr/bin/firefox --new-window http://"${adrs// /}":50070/explorer.html#/
 
echo "To check the cluster status browse: " "${adrs// /}":50070
echo "To check the Resource Manager status browse: " "${adrs// /}":8088
