FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=US/Mountain
ENV JDK_CUR_VERSION=14
ENV JDK_PREV_VERSION=13
ENV JTREG_VERSION=5.0-b01
ENV VENDOR_NAME=J-Class

RUN apt update

RUN apt install git wget autoconf build-essential zip unzip libx11-dev libxext-dev libxrender-dev libxrandr-dev libxtst-dev libxt-dev libcups2-dev libfontconfig1-dev libasound2-dev file openjdk-${JDK_PREV_VERSION}-jdk openjdk-8-jdk libffi-dev libelf-dev -y

RUN git clone https://github.com/openjdk/jdk${JDK_CUR_VERSION}u.git --depth=1

RUN git clone https://github.com/openjdk/jtreg --depth=1
RUN arch=$(dpkg --print-architecture) && cd jtreg && sh make/build-all.sh /usr/lib/jvm/java-8-openjdk-${arch}

COPY generate /
