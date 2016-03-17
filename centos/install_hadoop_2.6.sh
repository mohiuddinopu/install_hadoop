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
su -l hadoop -c '
echo "current user anme is "
whoami

cd ~
wget http://apache.claz.org/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz
tar xzf hadoop-2.6.0.tar.gz
mv hadoop-2.6.0 hadoop


# updates all path
cat /tmp/install_hadoop/bashrc_update >> ~/.bashrc


export JAVA_HOME=/opt/jdk1.8.0_66/

source ~/.bashrc


# Updates all configuration files

cat /tmp/install_hadoop/core-site.xml.update > $HADOOP_HOME/etc/hadoop/core-site.xml
cat /tmp/install_hadoop/hdfs-site.xml.update > $HADOOP_HOME/etc/hadoop/hdfs-site.xml
cat /tmp/install_hadoop/mapred-site.xml.update > $HADOOP_HOME/etc/hadoop/mapred-site.xml
cat /tmp/install_hadoop/yarn-site.xml.update > $HADOOP_HOME/etc/hadoop/yarn-site.xml

# Fromat namenode
/home/hadoop/hadoop/bin/hdfs namenode -format


# Start Hadoop 
$HADOOP_HOME/sbin/start-dfs.sh

# start yarn
$HADOOP_HOME/sbin/start-yarn.sh	

/home/hadoop/hadoop/bin/hdfs dfs -mkdir -p /user/hadoop

/home/hadoop/hadoop/bin/hdfs dfs -put /var/log/httpd logs

 '
adrs=`hostname -I`

/usr/bin/firefox --new-window http://$adrs:50070