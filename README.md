This script is based on freshly installed CentOS machine. This will install JDK 1.8 and Hadoop 2.6. 

Follow the steps

1. Login to your Centos machine GUI as root. The default password is 'password'
2. Download the repo as zipped file
3. Unzip the downloaded file
    cd /root/Downloads 
    unzip install_hadoop_ansible-master.zip

4. Navigate to the installation directory and run the script 
    cd install_hadoop_ansible-master/install_hadoop/ 
    chmod +x install_hadoop_2.6.sh 
    ./install_hadoop_2.6.sh

5. Switch user to hadoop and check if hadoop command works 
    su - hadoop 
    hadoop fs -ls /

Ignore the 'not found' error. In case the broswer failed to open, manually open the firefox and navigate to http://localhost:50700
