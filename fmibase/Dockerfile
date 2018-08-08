FROM centos:latest

# A base fmi image with proper repositories in place
# Possible also version locks and priorities
# Not much useful in itself

# Keep yum cache around, useful for multiple runs of the same machine
# In order to do this, mount /var/cache/yum to host machine directory
RUN sed -i -e 's/keepcache=0//' /etc/yum.conf && \
    echo keepcache=1 >> /etc/yum.conf

# Install some and delete cache
RUN \
 yum -y install https://download.fmi.fi/smartmet-open/rhel/7/x86_64/smartmet-open-release-17.9.28-1.el7.fmi.noarch.rpm && \
 yum -y install http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
 yum -y install https://download.fmi.fi/fmiforge/rhel/7/x86_64/fmiforge-release-17.9.28-1.el7.fmi.noarch.rpm && \
 yum -y install https://download.postgresql.org/pub/repos/yum/9.5/redhat/rhel-7-x86_64/pgdg-redhat95-9.5-3.noarch.rpm && \
 yum -y update && \
 yum clean all && \
 rm -rf /var/cache/yum

RUN mkdir -p /var/cache/yum && rm -f /root/anaconda-ks.cfg
VOLUME /var/cache/yum

CMD ["/bin/bash"]
