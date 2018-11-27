FROM kalilinux/kali-linux-docker

ARG BUILD_DATE
ARG VERSION
ARG VCS_URL
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.version=$VERSION \
      org.label-schema.name='Kali Linux' \
      org.label-schema.description='Official Kali Linux docker image' \
      org.label-schema.usage='https://www.kali.org/news/official-kali-linux-docker-images/' \
      org.label-schema.url='https://www.kali.org/' \
      org.label-schema.vendor='Offensive Security' \
      org.label-schema.schema-version='1.0' \
      org.label-schema.docker.cmd='docker run --rm kalilinux/kali-linux-docker' \
      org.label-schema.docker.cmd.devel='docker run --rm -ti kalilinux/kali-linux-docker' \
      org.label-schema.docker.debug='docker logs $CONTAINER' \
      io.github.offensive-security.docker.dockerfile="Dockerfile" \
      io.github.offensive-security.license="GPLv3"

# 证书支持
RUN apt-get -y update  \
    && apt-get install -y ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 阿里云镜像加速
RUN echo "deb https://mirrors.aliyun.com/kali kali-rolling main contrib non-free" > /etc/apt/sources.list \
    && echo "deb-src https://mirrors.aliyun.com/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && \
apt-get install -y \
net-tools \
xfce4 \
git \
x11vnc \
xvfb \
wget \
python \
python-numpy \
unzip \
terminator \
wget \
curl \
fcitx \
menu \
&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install noVNC websockify
RUN set -x \
    && cd /root && git clone https://github.com/kanaka/noVNC.git\
    && cd noVNC/utils && git clone https://github.com/kanaka/websockify websockify \
    && cd /root

# 增加启动脚本
ADD startup.sh /startup.sh

RUN chmod 0755 /startup.sh && \
apt-get autoremove -y && \
apt-get clean -y && \
rm -rf /var/lib/apt/lists/*

#The Kali Docker Image Is Out Of Date. : (
#RUN apt-get update -y && apt-get dist-upgrade -y

# 系统设置(设置时区).
RUN rm -rf /etc/localtime \
    && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# NOVNC
EXPOSE 6080

CMD /startup.sh