FROM ubuntu:latest

RUN apt update

RUN apt install mercurial wget autoconf build-essential zip unzip libx11-dev libxext-dev libxrenderer-dev libxrandr-dev linxtst-dev libxt-dev libcups2-dev libfontconfig1-dev libasound2-dev -y

RUN wget http://hg.openjdk.java.net/jdk/jdk14/archive/tip/tar.bz2

RUN wget https://download.java.net/openjdk/jdk13/ri/openjdk-13+33_linux-x64_bin.tar.gz

RUN wget https://ci.adoptopenjdk.net/view/Dependencies/job/jtreg/lastSuccessfulBuild/artifact/jtreg-5.0-b01.tar.gz

RUN tar xvf tip.tar.bz2

RUN tar xvf openjdk-13+33_linux_bin.tar.gz

RUN tar xvf jtreg-5.0-b01.tar.gz

RUN tar rm -fR tip.tar.bz2 openjdk-13+33_linux_bin.tar.gz jtreg-5.0-b01.tar.gz

RUN cd jdk14-* && bash configure --with-boot-jdk=../jdk-13 --with-jtreg=../jtreg

RUN cd jdk14-* && make images

RUN cd jdk14-* && ./build/*/images/jdk/bin/java -version

# RUN cd jdk14-* && make run-test-tier1

WORKDIR /root
