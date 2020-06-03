# jdk-build

## TODO

This project is not complete

## To build image

    docker build -t jdk-build .
    
## Start a container to get the generated build

    docker run -it --rm -v c:/jdk-build:/jdk14u bash
    
Once you start the container, you can get the build files from c:/jdk-build
