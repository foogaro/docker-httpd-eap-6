FROM centos

USER root

RUN yum -y update;yum clean all
RUN yum -y install tar unzip vi vim telnet
RUN yum -y install httpd apr apr-util apr-devel apr-util-devel krb5-workstation mod_auth_kerb
RUN yum -y install elinks locate python-setuptools; yum clean all

RUN easy_install supervisor

#RUN mkdir -p /opt/rh
#ADD software/jboss-ews-httpd-2.0.1-RHEL6-x86_64.zip /opt/rh/jboss-ews-httpd-2.0.1-RHEL6-x86_64.zip

#RUN echo "Unzipping the EWS"
#RUN cd /opt/rh; pwd; unzip jboss-ews-httpd-2.0.1-RHEL6-x86_64.zip

#RUN echo "cd /opt/rh/jboss-ews-2.0/httpd/sbin" >> /opt/rh/run-jboss-ews.sh
#RUN echo "./apachectl -k start -f /opt/rh/jboss-ews-2.0/httpd/conf/httpd.conf" >> /opt/rh/run-jboss-ews.sh
#RUN chmod +x /opt/rh/run-jboss-ews.sh

#RUN cd /opt/rh
#CMD ./opt/rh/run-jboss-ews.sh

RUN echo "[supervisord]" >> /etc/supervisord.conf
RUN echo "nodaemon=true" >> /etc/supervisord.conf
RUN echo "" >> /etc/supervisord.conf
RUN echo "[program:httpd]" >> /etc/supervisord.conf
RUN echo "command=bash -c \"httpd -k start -f /etc/httpd/conf/httpd.conf\"" >> /etc/supervisord.conf
RUN echo "stdout_logfile=/var/log/supervisor/%(program_name)s.log" >> /etc/supervisord.conf
RUN echo "stderr_logfile=/var/log/supervisor/%(program_name)s.log" >> /etc/supervisord.conf
RUN echo "autorestart=true" >> /etc/supervisord.conf
RUN echo "" >> /etc/supervisord.conf

#ADD software/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
#ADD software/supervisord.conf /etc/supervisord.conf
RUN cat /etc/supervisord.conf

#ADD software/mod_cluster-1.2.6.Final-linux2-x64-so.tar.gz /opt/rh/jboss-ews-2.0/httpd/modules
ADD software/mod_cluster-1.2.6.Final-linux2-x64-so.tar.gz /etc/httpd/modules
#RUN ls -la /opt/rh
#RUN ls -la /opt/rh/jboss-ews-2.0/httpd/modules
#RUN tar -C /opt/rh/jboss-ews-2.0/httpd/modules/ -zxvf /opt/rh/mod_cluster-1.2.6.Final-linux2-x64-so.tar.gz

RUN mkdir -p /var/log/supervisor
#ADD software/mod_cluster.conf /opt/rh/jboss-ews-2.0/httpd/conf.d/mod_cluster.conf
ADD software/mod_cluster.conf /etc/httpd/conf.d/mod_cluster.conf
#RUN cp /opt/rh/jboss-ews-2.0/httpd/conf/httpd.conf /etc/httpd/conf/

#EXPOSE 8119 8129 4557 4567 23364
EXPOSE 22 80

CMD ["/usr/bin/supervisord", "-n"]

