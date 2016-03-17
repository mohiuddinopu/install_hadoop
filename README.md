#install_hadoop_ansible

This script is based on CentOS. This will install JDK 1.8 and Hadoop 2.6. Follwo the steps

Login to your Centos machine GUI as root. The default password is 'password'
Download the repo as zipped file
Unzip the downloaded file into the directory cd /root/Downloads unzip install_hadoop_ansible-master.zip
Navigate to the installation directory and run the script cd install_hadoop_ansible-master/install_hadoop/ chmod +x install_hadoop_2.6.sh ./install_hadoop_2.6.sh
Switch user to hadoop and check if hadoop command works su - hadoop hadoop fs -ls /
Ignore the 'not found' error. In case the broswer failed to open, manually open the firefox and navigate to http://localhost:50700
