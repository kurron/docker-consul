FROM ubuntu:14.04

MAINTAINER Ron Kurr <kurr@kurron.org>

RUN apt-get --quiet update && \
    apt-get --quiet --yes install unzip && \
    apt-get clean

ADD https://bintray.com/artifact/download/mitchellh/consul/0.5.0_linux_amd64.zip /tmp/consul.zip

RUN cd /usr/sbin && unzip /tmp/consul.zip && chmod +x /usr/sbin/consul && rm /tmp/consul.zip

ADD consul.json /config/

ADD https://bintray.com/artifact/download/mitchellh/consul/0.5.0_web_ui.zip /tmp/webui.zip

RUN cd /tmp/ && unzip webui.zip && mv dist/ /webui/

# export meta-data about this container
ENV KURRON_CONSUL_VERSION 0.5.0 

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53/udp

VOLUME ["/data"]

ENTRYPOINT [ "/usr/sbin/consul", "agent", "-config-dir=/config" ]
CMD []
