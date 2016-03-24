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

Option 2 (Not tested)

1. As root in your Centos run the following in terminal 

    yum install git git-core

2. Once the GIT installaiton is done

    cd ~
    
    git clone git@github.com/mohiuddinopu/install_hadoop_ansible.git
    
    cd install_hadoop_ansible*
    
    chmod +x install_hadoop_2.6.sh 
    
    ./install_hadoop_2.6.sh
