# jdk-build

## Pre-requisite

Install [docker](https://docs.docker.com/docker-for-windows/install/)

## To build image

    docker build -t jdk-build .
    
## Start a container to get the generate build

    docker run -it --rm -v c:/jdk-build:/jdk-build jdk-build bash /generate
    
Once you start the container, it will run build process to generate JDK binaries and then run some unit test using jtreg. After the build finishes, it will store all files under `c:/jdk-build`. Change the path `c:/jdk-build` according to your host OS.

## TODO

This project is not complete

