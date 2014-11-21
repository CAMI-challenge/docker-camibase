FROM cami/interface

# add interface definition
COPY interface.conf /dckr/etc/interface.conf

# a single input FASTA file
ENV $DCKR_INFILE $DCKR_MNT/input/sample.fna

# a single output file
ENV $DCKR_OUTFILE $DCKR_MNT/output/sample.out

# a folder containig provided reference data(bases)
ENV $DCKR_REF $DCKR_MNT/camiref

# a folder to save data which is persistent between container execution
ENV $DCKR_CACHE $DCKR_MNT/cache

# a folder containing all data uploaded by the user
ENV $DCKR_UPLOAD $DCKR_MNT/upload

# the number of thread to be used by processes running in the container
ENV $DCKR_THREADS 1
