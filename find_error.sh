#!/bin/bash -l

#This does NOT work - do not use
#For notes only

set -e
set -o pipefail

SAM=$1
REF=$2
OUT_DIR=/scratch.global/lee02326/

#split -l$((`wc -l < "${SAM}"`/10)) ${SAM}
cd subfiles

function catch_err
{
  bash /scratch.global/lee02326/SNP_Utils_cowpea.sh "$3" "${REF}" "${OUT_DIR}"
  if [ $? != 0 ]
  then
    echo "$3"
  fi
}

for f in *
do
  catch_err "${f}"
done

#useful commands
for ((i=1;i<=10;i++)); do
  head -n $(($i*1000)) /scratch.global/lee02326/subfiles/TZ6.sam | tail -n 1000 > /scratch.global/lee02326/subfiles/"$i.sam" &
done

for f in *; do
  bash /scratch.global/lee02326/SNP_Utils_cowpea.sh /scratch.global/lee02326/subfiles/"$f" /scratch.global/lee02326/VunguiculataTZ30.v1.2.fa /scratch.global/lee02326 &
done
