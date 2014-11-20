FROM debian:stable
MAINTAINER Johannes Dröge, johannes.droege@uni-duesseldorf.de

ENV DEBIAN_FRONTEND noninteractive

ENV DCKR_MNT /dckr/mnt
ENV DCKR_TASKS /dckr/etc/tasks.d
#ENV DCKR_LOG /dckr/mnt/out/docker.log

# user UID must match UID of host shared folder, until docker supports proper user mapping
# unpriviledged container processes are more secure when mounting host folders
ENV DCKR_USER nobody

# anonymous volumes
VOLUME ["/tmp", "/var/tmp"]

# package installation - do it application-specific, not as part of the interface
#RUN apt-get -q update && apt-get install -q -y -o DPkg::Options::=--force-confnew \
#python2.7-minimal \
#python-minimal \
#bc \
#wget
#RUN apt-get -q clean && rm -rf /var/lib/apt/lists/*

# add container functionality
COPY dckr /dckr

# settings
RUN id $DCKR_USER || useradd -N -g nogroup $DCKR_USER
# in the following line, $DCKR_USER is not allowed in Docker 1.2
USER nobody
# in the following line, $DCKR_MNT is not allowed in Docker 1.2
#WORKDIR /dckr/mnt/out

# cleanup
RUN rm -rf /tmp/* /var/tmp/*

# default process on container startup
ENTRYPOINT ["/dckr/bin/run"]

# example for setting up specific software
#ENV MY_SOFTWARE_VERSION 0.0.1rc1-extended-64bit
#ADD my-software_$TTK_VERSION.tar.gz /opt
#RUN cd /opt && ln -s my-software_$TTK_VERSION my-software

