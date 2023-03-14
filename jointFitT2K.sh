#!/bin/bash

generation=0
nsubmit=1

NAME=t2kjointfit_

EXE=bin/jointFit

SCRIPTFOLDER=$(pwd)

CFG=jointFit2021
CFG_FOLDER=${SCRIPTFOLDER}/configs/

JOB=jobscript
JOBFOLDER=${SCRIPTFOLDER}/jobs


for i in $(seq 1 $nsubmit); do
    #configs
    index="${generation}_${i}"
    prevgen=$(( generation-1 ))
    CFGNEW=$CFG_FOLDER/${CFG}_${index}.cfg
    cp ${CFG_FOLDER}/${CFG}.cfg $CFGNEW
    
    echo $CFGNEW
    sed -i "s|BIGNUM|${index}|g" $CFGNEW
    sed -i "s|SMALLNUM|${prevgen}_${i}|g" $CFGNEW
    echo "Config ${index} made"
    
    #job scripts
    JOBNEW=${JOBFOLDER}/${JOB}_${index}.sh
    cp ${JOB}.sh ${JOBNEW}
    
    sed -i "s|EXE|./$EXE $CFGNEW|g" $JOBNEW
    sed -i "s|BIGNUM|${index}|g" $JOBNEW
    echo "Job ${index} made, submitting"
    echo $JOBNEW
    sbatch $JOBNEW
done
