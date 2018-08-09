FROM fmibase:latest

# An image useful for building fmi stuff, such as smartmet server
# Use this to run build tools

# Add some essential build tools
RUN yum -y update && \
    yum -y install yum-utils && \
    yum -y install ccache && \
    yum -y install git && \
    yum -y install rpmlint && \
    rm -rf /var/cache/yum/*

RUN mkdir -p /var/cache/yum && \
    rm -rf /root/.ccache /root/anaconda-ks.cfg && \
    mkdir -m 777 /ccache && \
    echo cache_dir=/ccache > /etc/ccache.conf && \
    echo umask=000 >> /etc/ccache.conf && \
    ln -s /usr/bin/ccache /usr/local/bin/c++ && \
    ln -s /usr/bin/ccache /usr/local/bin/g++ && \
    ln -s /usr/bin/ccache /usr/local/bin/gcc && \
    ln -s /usr/bin/ccache /usr/local/bin/cc

# Mounting /ccache to host directory will make repeated
# builds of same software significantly faster
VOLUME /ccache

CMD ["bash"]
