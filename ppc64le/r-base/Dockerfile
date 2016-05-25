FROM ppc64le/centos7:latest

MAINTAINER "jhsea3do" jhsea3do@gmail.com

#RUN /usr/sbin/useradd docker \
#        && mkdir /home/docker \
#        && chown docker:docker /home/docker \
#        && /usr/sbin/groupadd docker staff

RUN yum update && yum install -y tar gzip xz \
        ed \
        less \
        locales \
        vim-tiny \
        wget \
        ca-certificates 

#RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
#	&& localedef -v -c -i en_US -f UTF-8 en_US.UTF-8 \
#	&& export LANG=en_US.UTF-8


ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

ENV R_BASE_VERSION 3.2.3

RUN yum install -y R-${R_BASE_VERSION} \
        R-devel-${R_BASE_VERSION}

CMD [ "R" ]
