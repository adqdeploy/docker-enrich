FROM  adjs/docker-python:latest

RUN mkdir /usr/src/enricher
WORKDIR /usr/src
RUN git clone https://github.com/adqio/python-confluent-schemaregistry.git && cd python-confluent-schemaregistry && python setup.py bdist_egg && cp dist/*.egg /usr/src/enricher/
RUN git clone https://github.com/dpkp/kafka-python.git && cd kafka-python && python setup.py bdist_egg && cp dist/*.egg /usr/src/enricher/
RUN git clone https://github.com/tebeka/fastavro.git && cd fastavro && python setup.py bdist_egg && cp dist/*.egg /usr/src/enricher/ 
RUN apt-get -y update && apt-get -y install curl && curl -s http://d3kbcqa49mib13.cloudfront.net/spark-1.6.0-bin-hadoop2.4.tgz | tar -xz -C /usr/local/
 

