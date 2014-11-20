docker-camibase
==========

docker-camibase is a Docker container which serves as basis for building user-specific containers.

The Dockerfile and /dckr folder define an interface and enforce the binding of all the interchange directories in the container. They also define tasks which can be specified as the first docker run command line parameter. The Dockerfile sets the default user which is used to run all the commands inside the container to 'nobody' because this seems to be the only user with a consistent UID mapping from host to container for most distributions (besides the default user root who can do anything to the host filesystem). This is a precaution because currently there is no user remapping for mounted host directories for Docker to prevent processes in the host to modify or delete files on the host filesystem.

Interface
---------

1. Three paths are mounted to directories of the host system:
	
	a) /dckr/mnt/in 	-- mounted as read-only, contains input files to the container
	b) /dckr/mnt/ref	-- mounted as read-write, contains provided and user-generated reference data
	c) /dckr/mnt/out	-- mounted as read-write, contains output files from the container

2. One path contains shell scripts that can be executed (called "tasks"):

	/dckr/etc/tasks.d/

3. A default process which is executed on the startup of the container. 

	/dckr/bin/run


Usage
-----

1. Get Docker build files

        git clone https://github.com/CAMI-challenge/docker-camibase.git

2. Build the Docker image

        docker build -t="docker-camibase" docker-camibase

3. Create the interface

        mkdir in out ref  # directies which are mounted in the container
        mv mysample.fna in/sample.fna  # move your sample to the in folder
        sudo chown -R nobody in out ref  # make read-writable for user nobody

4. Run Docker container

        docker run -v $PWD/in:/dckr/mnt/in:ro -v $PWD/ref:/dckr/mnt/ref:rw -v $PWD/out:/dckr/mnt/out:rw fungs/taxator-tk download-refpack

