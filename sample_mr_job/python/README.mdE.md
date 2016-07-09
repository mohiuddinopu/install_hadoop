Instruction to run Python Map Reduce job 

1. mkdir ~/python_mr
   cd ~/python_mr

2. Download the mapper.py and reducer.py files
  curl -L -O https://raw.githubusercontent.com/mohiuddinopu/install_hadoop/master/sample_mr_job/python/mapper.py
  curl -L -O https://raw.githubusercontent.com/mohiuddinopu/install_hadoop/master/sample_mr_job/python/reducer.py

3. Download the streaming jar file 
  wget http://central.maven.org/maven2/org/apache/hadoop/hadoop-streaming/2.6.0/hadoop-streaming-2.6.0.jar
  
4. Upload a sample file in HDFS
   echo "this is a testing file, which has no meaning" > sample.txt
   hadoop fs -mkdir /tmp/input
   hadoop fs -put sample.txt /tmp/input/

5. Run the job 
   /opt/hadoop/bin/hadoop jar hadoop-streaming-2.6.0.jar  -file mapper.py  -mapper mapper.py -file reducer.py   -reducer reducer.py -input /tmp/input -output /tmp/output
   
6. Check the output directory in file browser

   
