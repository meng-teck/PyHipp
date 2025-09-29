#!/bin/bash

# Submit this script with: sbatch <this-filename>

#SBATCH --time=24:00:00   # walltime
#SBATCH --ntasks=1   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --cpus-per-task=1   # number of CPUs for this task
#SBATCH -J "cumulative"   # job name

## /SBATCH -p general # partition (queue)
#SBATCH -o cumulative-slurm.%N.%j.out # STDOUT
#SBATCH -e cumulative-slurm.%N.%j.err # STDERR

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE
python -u -c "import PyHipp as pyh; \
import DataProcessingTools as DPT; \
import os; \
alldirs = [d for d in os.listdir('.') if os.path.isdir(d)]; \
exclude_dirs = [d for d in alldirs if d not in ['20181101', '20181102']]; \
wfall = DPT.objects.processDirs(dirs=None, exclude=['*eye*', '*mountains*', '*array04*'] + exclude_dirs, objtype=pyh.Waveform); \
wfall.save();"
