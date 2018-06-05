FROM docker.io/ubuntu:16.04
MAINTAINER Jacek Danecki <jacek.m.danecki@gmail.com>

COPY build.sh /root

RUN apt-get -y update 
RUN apt-get install -y --allow-unauthenticated clang-4.0 cmake git patch flex zlib1g-dev python ccache bison pkg-config

RUN /root/build.sh
CMD ["/bin/bash"]
