#!/bin/bash
#SBATCH --job-name=jointFit_BIGNUM
#SBATCH --output=logs/jointFit_BIGNUM.out
#SBATCH --error=logs/jointFit_BIGNUM.err
#SBATCH --account=def-blairt2k
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --gres=gpu:1
#SBATCH --time=1-0
#SBATCH --mem=24G                                                                     

nvidia-smi

cd /home/henryi/t2ksft/MaCh3_Develop/
source setup.sh 

EXE
