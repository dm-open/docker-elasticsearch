FROM dockerfile/java:oracle-java7
MAINTAINER Mark Smithson mark@carsnip.com
RUN apt-get update
RUN apt-get upgrade -y
ENV REFRESHED_AT 2014-10-21

# Install Elastic Search
RUN wget -O /tmp/elasticsearch.tar.gz https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.4.tar.gz
RUN tar -C /opt/ -xvf /tmp/elasticsearch.tar.gz
RUN rm -f /tmp/elasticsearch.tar.gz

RUN ln -s /opt/elasticsearch-1.3.4 /opt/elasticsearch

# Install Plugins
RUN /opt/elasticsearch/bin/plugin -install elasticsearch/elasticsearch-cloud-aws/2.3.0
RUN /opt/elasticsearch/bin/plugin -install elasticsearch/marvel/latest
RUN /opt/elasticsearch/bin/plugin -install karmi/elasticsearch-paramedic

ADD config/elasticsearch.yml /opt/elasticsearch/config/elasticsearch.yml
ADD sysctl.d/60-elasticsearch /etc/sysctl.d/60-elasticsearch
VOLUME ["/data"]

WORKDIR /data

EXPOSE 9200 
EXPOSE 9300

RUN ulimit -l unlimited

ENTRYPOINT ["/opt/elasticsearch/bin/elasticsearch"]
