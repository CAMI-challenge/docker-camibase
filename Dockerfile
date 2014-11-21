FROM cami/interface

# add interface definition
COPY dockermount.conf /dckr/etc/

# single input FASTA file
ENV DCKR_INFILE $DCKR_MNT/input/sample.fna

# single output file
ENV DCKR_OUTFILE $DCKR_MNT/output/sample.out

# folder containig provided reference data(bases)
ENV DCKR_CAMIREF $DCKR_MNT/camiref

# folder to save data which is persistent between container execution
ENV DCKR_CACHE $DCKR_MNT/cache

# folder containing all data uploaded by the user
ENV DCKR_USERREF $DCKR_MNT/userref

# number of thread to be used by processes running in the container
ENV DCKR_THREADS 1
