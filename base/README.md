base-image
==========

base is a Docker image which serves as basis for building user-specific containers. The interface it simply defined in the interface.conf file.

Usage
---------

1. Mount point of host system directories: /dckr/mnt
	
2. Shell scripts that can be executed (called "tasks"): /dckr/etc/tasks.d/

3. Default process which is executed on container startup: /dckr/bin/run


Usage
-----

1. Get Docker build files

        git clone https://github.com/CAMI-challenge/docker-camibase.git

2. Build the Docker image

        docker build -t="cami/base" docker-camibase

3. Create the interface

        mkdir in out ref  # directies which are mounted in the container
        mv mysample.fna in/sample.fna  # move your sample to the in folder
        sudo chown -R nobody in out ref  # make read-writable for user nobody

4. Run Docker container

        docker run -v $PWD/in:/dckr/mnt/in:ro -v $PWD/ref:/dckr/mnt/ref:rw -v $PWD/out:/dckr/mnt/out:rw fungs/taxator-tk download-refpack

