camibase
==========

camibase is a Docker image which serves as basis for building user-specific containers.

Variables
-----

```$DCKR_INFILE```: single input FASTA file

```$DCKR_OUTFILE```: single output file

```$DCKR_REF```: folder containig provided reference data(bases)

```$DCKR_CACHE```: folder to save data which is persistent between container execution

```$DCKR_UPLOAD```: folder containing all data uploaded by the user

```$DCKR_THREADS```: number of thread to be used by processes running in the container

```$DCKR_USER```: optional non-root user to be used in the container (Dockerfile statemente USER) 

Usage
-----
1. Pull container cami/base
2. Add/install software in your container
3. Add a file with the commands to run as $DCKR_TASKS/mytask (using the defined variables)
4. Run the resulting docker container using ```docker run mycontainer mytask```
