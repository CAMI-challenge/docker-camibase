camibase
==========

camibase is a Docker image which serves as basis for building user-specific containers.

Variables
-----

# a single input FASTA file
$DCKR_INFILE

# a single output file
$DCKR_OUTFILE

# a folder containig provided reference data(bases)
$DCKR_REF

# a folder to save data which is persistent between container execution
$DCKR_CACHE

# a folder containing all data uploaded by the user
$DCKR_UPLOAD

# the number of thread to be used by processes running in the container
$DCKR_THREADS

Usage
-----

Run Docker container using the following run command.
