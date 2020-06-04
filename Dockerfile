FROM ubuntu:20.04

RUN apt update

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=US/Mountain
ENV JDK_CUR_VERSION=14u
ENV JDK_PREV_VERSION=13u
ENV JTREG_VERSION=5.0-b01

RUN apt install git wget autoconf build-essential zip unzip libx11-dev libxext-dev libxrender-dev libxrandr-dev libxtst-dev libxt-dev libcups2-dev libfontconfig1-dev libasound2-dev file dos2unix -y

RUN git clone https://github.com/openjdk/jdk${JDK_CUR_VERSION}.git --depth=1

# TODO: Find out if we could use source instead of binary. If yes, we could use git to download code
RUN wget https://download.java.net/openjdk/jdk13/ri/openjdk-13+33_linux-x64_bin.tar.gz

RUN tar xvf openjdk-13+33_linux-x64_bin.tar.gz && rm -fR openjdk-13+33_linux-x64_bin.tar.gz

# TODO: Build from source
RUN wget https://ci.adoptopenjdk.net/view/Dependencies/job/jtreg/lastSuccessfulBuild/artifact/jtreg-5.0-b01.tar.gz
RUN tar xf jtreg-5.0-b01.tar.gz
RUN rm -f jtreg-5.0-b01.tar.gz

COPY generate /
RUN chmod +x /generate
RUN dos2unix /generate

ENTRYPOINT ["/bin/bash", "/generate"]
