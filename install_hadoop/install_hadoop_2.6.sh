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
echo "#####################################"
echo "current user Name is "
whoami
echo "#####################################"

rm -rf ~/hadoop*

cd ~
wget http://apache.claz.org/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz
tar xzf hadoop-2.6.0.tar.gz
mv hadoop-2.6.0 hadoop


# updates all path
cat $crntdir/bashrc >> ~/.bashrc


export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk.x86_64/

source ~/.bashrc


# Updates all configuration files

cat $crntdir/core-site.xml > $HADOOP_HOME/etc/hadoop/core-site.xml
cat $crntdir/hdfs-site.xml > $HADOOP_HOME/etc/hadoop/hdfs-site.xml
cat $crntdir/mapred-site.xml > $HADOOP_HOME/etc/hadoop/mapred-site.xml
cat $crntdir/yarn-site.xml > $HADOOP_HOME/etc/hadoop/yarn-site.xml

# Fromat namenode
/home/hadoop/hadoop/bin/hdfs namenode -format

# start yarn
$HADOOP_HOME/sbin/start-yarn.sh	

# Start Hadoop 
$HADOOP_HOME/sbin/start-dfs.sh


/home/hadoop/hadoop/bin/hdfs dfs -mkdir -p /user/hadoop


 '
export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk.x86_64/
source ~/.bashrc


adrs=`hostname -I`
 
/usr/bin/firefox --new-window http://"${adrs// /}":50070/explorer.html#/
 
echo "To check the cluster status browse: " "${adrs// /}":50070
