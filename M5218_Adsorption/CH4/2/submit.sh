#!/bin/bash

#SBATCH -J adsorption                                 # job name
#SBATCH -o adsorption.o.%j                            # output and error file name (%j expands to jobID)
#SBATCH -e adsorption.e.%j
#SBATCH -N 1                                    # number of nodes requested
#SBATCH -n 80                                   # total number of mpi tasks requested, each node has 48 cores XXX=YY*48
#SBATCH -p icx                                  # partition (options: skx, skx-dev,
#SBATCH --mail-user=[MY_EMAIL_ADDRESS]
#SBATCH --mail-type=all
#SBATCH -t 08:00:00                             # run time (hh:mm:ss)

# This submission script will run ten GCMC adsorption simulations on a fixed-frame polymer in Cassandra

module load intel/24.0
module load impi/21.11
export OMP_NUM_THREADS=8

numactl -C 0-7 $WORK/Cassandra/Src/cassandra_gfortran_openMP.exe input_0.1 &
numactl -C 8-15 $WORK/Cassandra/Src/cassandra_gfortran_openMP.exe input_0.5 &
numactl -C 16-23 $WORK/Cassandra/Src/cassandra_gfortran_openMP.exe input_1.0 &
numactl -C 24-31 $WORK/Cassandra/Src/cassandra_gfortran_openMP.exe input_2.0 &
numactl -C 32-39 $WORK/Cassandra/Src/cassandra_gfortran_openMP.exe input_5.0 &
numactl -C 40-47 $WORK/Cassandra/Src/cassandra_gfortran_openMP.exe input_8.0 &
numactl -C 48-55 $WORK/Cassandra/Src/cassandra_gfortran_openMP.exe input_10.0 &
numactl -C 56-63 $WORK/Cassandra/Src/cassandra_gfortran_openMP.exe input_12.0 &
numactl -C 64-71 $WORK/Cassandra/Src/cassandra_gfortran_openMP.exe input_15.0 &
numactl -C 72-79 $WORK/Cassandra/Src/cassandra_gfortran_openMP.exe input_20.0

wait
