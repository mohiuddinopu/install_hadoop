# current dir
crntdir=`pwd`

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
wget http://apache.claz.org/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz
tar xzf hadoop-2.6.0.tar.gz
mv hadoop-2.6.0 /opt/hadoop
chmod 777 /opt/hadoop

# updates all path
cat $crntdir/bashrc.sh >> /home/hadoop/.bashrc


# this export for hadoop user 
#export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk.x86_64/

# Updates all configuration files

cat $PWD/core-site.xml > /opt/hadoop/etc/hadoop/core-site.xml
cat $PWD/hdfs-site.xml > /opt/hadoop/etc/hadoop/hdfs-site.xml
cat $PWD/mapred-site.xml > /opt/hadoop/etc/hadoop/mapred-site.xml
cat $PWD/yarn-site.xml > /opt/hadoop/etc/hadoop/yarn-site.xml

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

ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys


# Fromat namenode
/opt/hadoop/bin/hdfs namenode -format

# start yarn
/opt/hadoop/sbin/start-yarn.sh	


sleep 30

# Start Hadoop 
/opt/hadoop/sbin/start-dfs.sh

sleep 30

# make testing hdfs directory
#/opt/hadoop/bin/hdfs dfs -mkdir -p /user/hadoop


' # end of hadoop user acitivity 


adrs=`hostname -I`
/usr/bin/firefox --new-window http://"${adrs// /}":50070/explorer.html#/
 
echo "To check the cluster status browse: " "${adrs// /}":50070
