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
#su -l hadoop -c '
#echo "#####################################"
#echo "current user Name is "
#whoami
#echo "#####################################"

rm -rf /opt/hadoop*

cd ~

wget http://apache.claz.org/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz
tar xzf hadoop-2.6.0.tar.gz
mv hadoop-2.6.0 /opt/hadoop


# updates all path
cat $crntdir/bashrc >> /home/hadoop/.bashrc


su -l hadoop -c '

# this export for hadoop user 
export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk.x86_64/
source ~/.bashrc

' # end of hadoop user acitivity 


# Updates all configuration files

cat $crntdir/core-site.xml > /opt/hadoop/etc/hadoop/core-site.xml
cat $crntdir/hdfs-site.xml > /opt/hadoop/etc/hadoop/hdfs-site.xml
cat $crntdir/mapred-site.xml > /opt/hadoop/etc/hadoop/mapred-site.xml
cat $crntdir/yarn-site.xml > /opt/hadoop/etc/hadoop/yarn-site.xml

# this export for root user 
export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk.x86_64/
source ~/.bashrc

# Fromat namenode
/opt/hadoop/bin/hdfs namenode -format

# start yarn
/opt/hadoop/sbin/start-yarn.sh	

# Start Hadoop 
/opt/hadoop/sbin/start-dfs.sh

# make testing hdfs directory
/opt/hadoop/hadoop/bin/hdfs dfs -mkdir -p /user/hadoop

adrs=`hostname -I`
/usr/bin/firefox --new-window http://"${adrs// /}":50070/explorer.html#/
 
echo "To check the cluster status browse: " "${adrs// /}":50070
