---
layout: post
title: Installing Spark on Ubuntu 18.04
tags: big data
---

This post contains the steps that I followed to install Spark on my Ubuntu 18.04 (Bionic). I first tried with the pre-build verstion available in their site, but when I tried to play with it it threw an error. After that, I tried with the more *serious* alternatives: installatation with Maven, wich did not work either, and with SBT, which worked after some hours of struggle.


First thing is to download and extract the .tgz file from [the official website](http://spark.apache.org/downloads.html)


    wget https://archive.apache.org/dist/spark/spark-2.3.1/spark-2.3.1.tgz
    tar -zxvf spark-2.3.1.tgz
    cd spark-2.3.1


Check that we have Java 8 or higher, and whether we have the JAVA_HOME environment variable properly defined:

    java --version
    echo $JAVA_HOME$

Java 9 might give problems with Spark, so some people install Java 8. Oracle Java 8 is not in the official repositories of Ubuntu 18. Thus, I added the repositorioes and then installed it.

    sudo add-apt-repository ppa:webupd8team/java
    sudo apt-get update
    sudo apt install oracle-java8-set-default

 Check that java and javac use both Oracle 8:

    sudo update-alternatives --config java
    sudo update-alternatives --config javac
    
And then check that the environment variable JAVA_HOME is also set to Java 8. Modify it if necessary:

    echo $JAVA_HOME
    export JAVA_HOME="/usr/lib/jvm/java-8-oracle/"

Add the last line to the ~/.bashrc file to make it permanent.

Now Install `pyspark`, the Python interface to Spark to to write  to execute pyspark scripts (python calling spark)

    pip install pyspark

My attempt to build Spark using maven or SBT did not work. Some of the compiling errors looked like it had something to do with Scala. So I installed Scala (SBT) following the instructions [from their site](https://www.scala-sbt.org/download.html?_ga=2.151093565.506191957.1537690680-997580507.1537641438).

    echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
    sudo apt-get update
    sudo apt-get install sbt

 Finally, I could install spark with
 
     ./build/sbt package

And then I moved the complete spark directory to the /opt/ directory

    sudo mv spark-2.3.1 /opt/spark-2.3.1
    sudo ln -s /opt/spark-2.3.1 /opt/spark

  
 With this symbolic link we can install multiple Spark versions in the /opt/ directory, and the link (that we will use in the environment variables) will point to the active one. Finally, we set the SPARK environment variables in our ~/.bashrc file:
 
    export SPARK_HOME=/opt/spark
    export PATH=$SPARK_HOME/bin:$PATH
 
After these steps, I could start playing with the [quick start tutorial](https://spark.apache.org/docs/latest/quick-start.html). I entered the pyspark shell:

    pyspark
   
And then everything seemed to work fine:
   
    >>> textFile = spark.read.text("/opt/spark/README.md")
    >>> textFile.count()
    103 
    >>> textFile.first()
    Row(value='# Apache Spark')

    
But I don't like shells, I prefer Jupyter notebooks. Let's see how we can use pyspart from a Jupyter network. A first option is to install findspark so that we can find spark from any Jupiter notebook:

    pip install findspark

Then we can start our code in a Jupyter notebook as
 
    import findspark
    findspark.init()
    import pyspark
 
A second alternative is to let Jupyter notebook be the default shell for pyspark, adding to our  ~/.bashrc file:

    export PYSPARK_DRIVER_PYTHON=jupyter
    export PYSPARK_DRIVER_PYTHON_OPTS='notebook'

Now we can call pyspark from the command line and write our first program in a notebook. The following code approximates the pi value using a Monte Carlo algorithm. We draw ramdom points within a unit square and count how many of them fall inside the curve  $x^2 + y^2$. We are working in one of the quadrants of a circle with radius 1. The area of the whole circle is, by definition, $\pi$. Therefore $\pi$ can be approximated as  $$ \pi= 4*s \approx 4 * inside / total$$. The code is

    import random
    num_samples = 100000000
    
    def inside(p):     
         x, y = random.random(), random.random()
         return x*x + y*y < 1

    count = sc.parallelize(range(0, num_samples)).filter(inside).count()
    pi = 4 * count / num_samples
    print(pi)
    sc.stop()
    
    # 3.14109824

where each parallel worker draws a sample and communicated whether if felt inside or outside the circle curve. Spark counts the number of positive responses from the workers and then we compute the total proportion to approximate $\pi$.
### References

Some links I visited during the installation:

* https://www.davidadrian.cc/posts/2017/08/how-to-spark-cluster/
* https://stackoverflow.com/questions/28565837/filename-too-long-sbt
* https://blog.sicara.com/get-started-pyspark-jupyter-guide-tutorial-ae2fe84f594f