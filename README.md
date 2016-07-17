This script is based on freshly installed CentOS machine. This will install JDK 1.8 and Hadoop 2.6. 


1. As root in your Centos run the following in terminal. For Ubuntu users, to login to root user do, "sudo passwd root" and enter a new password.  

            centos:    yum install git git-core


            ubuntu:    apt-get install git git-core

2. Once the GIT installaiton is done

            cd ~
    
            git clone https://github.com/mohiuddinopu/install_hadoop.git
        
            mv install_hadoop/ /tmp/    

            centos:     cd /tmp/install_hadoop/install_hadoop_centos/

            ubuntu:     cd /tmp/install_hadoop/install_hadoop_ubuntu/
    
            chmod +x install_hadoop_2.6.sh 
    
            ./install_hadoop_2.6.sh
    
Notes: Press 'y' or type 'yes' each time asked for any permission


Know Issue:

1. If the script completes with warning "0.0.0.0: Host key verification failed", but the UI is not available, do the following from root user and re-run the script. 


            su hadoop
            ssh localhost

Press 'y' or type 'yes' each time asked for any permission

Run Sample Yarn job

yarn jar /home/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.6.0.jar pi 10 1000
