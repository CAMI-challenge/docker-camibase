camibase
==========

camibase is a Docker image which serves as basis for building user-specific containers.

Usage
-----
1. Pull container using ```docker pull cami/base```
2. Add/install software in your container (refer to the manual for building an application container)
3. Add a file with the commands to run using the defined variables (refer to the manual for building an application container)
4. Save you container as a named image (refer to the manual for building an application container)
4. Run the resulting docker container using ```docker run [docker options] myimage mytask```

Variables for use in container
-----

Please only use the following environment variables in your scripts and applications. Do not use absolute paths except for mounting the host volumes to the container (this is a limitation of the docker commmand). To see the actual content of these variables, etc. for mounting, see the output of ```docker run myimage --env```.

```$DCKR_INFILE```: single input FASTA file

```$DCKR_OUTFILE```: single output file

```$DCKR_CAMIREF```: folder containig provided reference data(bases)

```$DCKR_CACHE```: folder to save data which is persistent between consecutive container executions

```$DCKR_USERREF```: folder containing all data uploaded/provided by the user

```$DCKR_THREADS```: number of threads to be used by processes running in the container

```$DCKR_USER```: optional non-root user to be used in the container (Dockerfile statement USER) 

