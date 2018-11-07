# 制定系统版本为ubuntu18.04
FROM ubuntu:18.04

MAINTAINER hihzhou <hihzohou@gmail.com>


COPY build.sh /build.sh
RUN bash /build.sh \
&& rm /build.sh

ENV LD_LIBRARY_PATH /usr/local/lib

