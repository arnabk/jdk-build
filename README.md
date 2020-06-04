# jdk-build

## TODO

This project is not complete

## To build image

    docker build -t jdk-build .
    
## Start a container to get the generated build

    docker run -it --rm -v c:/jdk-build:/jdk14u jdk-build
    
Once you start the container, it will run build process to generate JDK binaries and then run some unit test using jtreg. After the build finishes, it will store all files under `c:/jdk-build`
