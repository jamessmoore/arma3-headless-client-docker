FROM ubuntu

# Set up apt.
RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository multiverse
RUN dpkg --add-architecture i386

# Install steamcmd.
RUN apt-get update
RUN yes 2 | apt-get install -y steamcmd
RUN apt-get install -y openjdk-9-jre
RUN apt-get install -y ciopfs
RUN apt-get install -y fuse

# We don't install Arma 3 as part of the docker build because it can't be
# installed with anonymous login, and using --build-arg would make the
# credentials visible in the build history.

WORKDIR /opt/arma3

ADD install_arma3.txt install_arma3.txt
ADD start.sh start.sh
ADD arma3sync arma3sync

# Install Arma 3 and launch the client.
ENTRYPOINT ["/bin/bash", "start.sh"]

# Additional arguments for arma3server (such as -mod) can be passed as arguments
# to the container.
CMD []
