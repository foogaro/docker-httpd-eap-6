FROM centos

USER root

RUN echo '%jboss ALL=(ALL) ALL' >> /etc/sudoers

RUN useradd -m -d /home/jboss -p jboss jboss


RUN yum -y update;yum clean all
RUN yum -y install tar unzip vi vim telnet wget curl linx locate; yum clean all
RUN yum -y install java-1.7.0-openjdk which telnet unzip openssh-server sudo openssh-clients;yum clean all
ENV JAVA_HOME /usr/lib/jvm/jre


RUN mkdir -p /opt/rh
ADD software/jboss-eap-6.2.0.zip /opt/rh/jboss-eap-6.2.0.zip
ADD software/jboss-eap-6.2.3-patch.zip /opt/rh/jboss-eap-6.2.3-patch.zip
RUN cd /opt/rh; unzip jboss-eap-6.2.0.zip; ls -la
ENV JBOSS_HOME /opt/rh/jboss-eap-6.2

RUN $JBOSS_HOME/bin/add-user.sh --silent=true jboss jboss.2014

RUN cd $JBOSS_HOME; cp -a domain dc; cp -a dc hc1; cp -a hc1 hc2; ls -la
ADD software/dc.domain.xml $JBOSS_HOME/dc/configuration/domain.xml
RUN mv $JBOSS_HOME/hc1/configuration/domain.xml $JBOSS_HOME/hc1/configuration/domain.xml.unused
RUN mv $JBOSS_HOME/hc2/configuration/domain.xml $JBOSS_HOME/hc2/configuration/domain.xml.unused
ADD software/hc1.host.xml $JBOSS_HOME/hc1/configuration/host.xml
ADD software/hc2.host.xml $JBOSS_HOME/hc2/configuration/host.xml

RUN echo "ifconfig | grep 172 | awk '{print \$2}' | sed 's/addr://g'" >> $JBOSS_HOME/jboss.bind.address

EXPOSE 22 80 8119 8129 4557 4567 23364

RUN echo "nohup $JBOSS_HOME/bin/domain.sh -Djboss.domain.base.dir=$JBOSS_HOME/dc &" >> /opt/rh/run-all.sh
RUN echo "nohup $JBOSS_HOME/bin/domain.sh -Djboss.domain.base.dir=$JBOSS_HOME/hc1 -Djboss.bind.address=\``cat $JBOSS_HOME/jboss.bind.address`\` -Djboss.node.name=docker-hc-1 -Dproxy.list=172.17.0.2:6666 &" >> /opt/rh/run-all.sh
RUN echo "nohup $JBOSS_HOME/bin/domain.sh -Djboss.domain.base.dir=$JBOSS_HOME/hc2 -Djboss.bind.address=\``cat $JBOSS_HOME/jboss.bind.address`\` -Djboss.node.name=docker-hc-2 -Dproxy.list=172.17.0.2:6666 &" >> /opt/rh/run-all.sh

RUN chmod +x /opt/rh/run-all.sh

CMD /opt/rh/run-all.sh

