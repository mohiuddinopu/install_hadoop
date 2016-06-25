Usage
Assuming HADOOP_HOME is the root of the installation and HADOOP_VERSION is the Hadoop version installed, compile WordCount.java and create a jar:

$ mkdir wordcount_classes 
$ javac -classpath ${HADOOP_HOME}/hadoop-${HADOOP_VERSION}-core.jar -d wordcount_classes WordCount.java 
$ jar -cvf /usr/joe/wordcount.jar -C wordcount_classes/ .

Assuming that:

/usr/joe/wordcount/input - input directory in HDFS
/usr/joe/wordcount/output - output directory in HDFS
Sample text-files as input:

$ bin/hadoop dfs -ls /usr/joe/wordcount/input/ 
/usr/joe/wordcount/input/file01 
/usr/joe/wordcount/input/file02 

$ bin/hadoop dfs -cat /usr/joe/wordcount/input/file01 
Hello World Bye World 

$ bin/hadoop dfs -cat /usr/joe/wordcount/input/file02 
Hello Hadoop Goodbye Hadoop

Run the application:

$ bin/hadoop jar /usr/joe/wordcount.jar org.myorg.WordCount /usr/joe/wordcount/input /usr/joe/wordcount/output

Output:

$ bin/hadoop dfs -cat /usr/joe/wordcount/output/part-00000 
Bye 1 
Goodbye 1 
Hadoop 2 
Hello 2 
World 2 
Applications can specify a comma separated list of paths which would be present in the current working directory of the task using the option -files. The -libjars option allows applications to add jars to the classpaths of the maps and reduces. The option -archives allows them to pass comma separated list of archives as arguments. These archives are unarchived and a link with name of the archive is created in the current working directory of tasks. More details about the command line options are available at Commands Guide.

Running wordcount example with -libjars, -files and -archives: 
hadoop jar hadoop-examples.jar wordcount -files cachefile.txt -libjars mylib.jar -archives myarchive.zip input output Here, myarchive.zip will be placed and unzipped into a directory by the name "myarchive.zip".

Users can specify a different symbolic name for files and archives passed through -files and -archives option, using #.

For example, hadoop jar hadoop-examples.jar wordcount -files dir1/dict.txt#dict1,dir2/dict.txt#dict2 -archives mytar.tgz#tgzdir input output Here, the files dir1/dict.txt and dir2/dict.txt can be accessed by tasks using the symbolic names dict1 and dict2 respectively. The archive mytar.tgz will be placed and unarchived into a directory by the name "tgzdir".

