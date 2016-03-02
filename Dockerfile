FROM  adjs/docker-python:latest

RUN mkdir /usr/src/enricher
WORKDIR /usr/src
RUN git clone https://github.com/adqio/python-confluent-schemaregistry.git && cd python-confluent-schemaregistry && python setup.py bdist_egg && cp dist/*.egg /usr/src/enricher/
RUN git clone https://github.com/dpkp/kafka-python.git && cd kafka-python && python setup.py bdist_egg && cp dist/*.egg /usr/src/enricher/
RUN git clone https://github.com/tebeka/fastavro.git && cd fastavro && python setup.py bdist_egg && cp dist/*.egg /usr/src/enricher/ 
RUN cd /tmp && git clone https://adqdeploy:05dca6a7a7757481b3fe086af90b8323e875ae6b@github.com/adqio/rd.git 
RUN apt-get -y update && apt-get -y install software-properties-common curl && curl -s http://d3kbcqa49mib13.cloudfront.net/spark-1.6.0-bin-hadoop2.4.tgz | tar -xz -C /usr/local/
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
RUN pip install avro 
