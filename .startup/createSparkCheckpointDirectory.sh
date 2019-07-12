#!/bin/bash
#
# Spark Structured Streaming requires a checkpoint directory to enable restart of a query after a failure
# Here we create that directory on dsefs
#
echo "Starting creation of Spark Checkpoint Directory"
if [ `hostname` == 'node0' ]
then

  #Race Condition DSE has not started
  echo "Has DSE Started?"
  if ! nc -z node0 9042; then

    counter=0
    iterations=36
    sleepInterval=5

    echo "Waiting for DSE to start..."
    while  ! nc -z node0 9042; do

       echo "Waiting for DSE... Iteration: $counter Sleep: $sleepInterval seconds..."

       sleep $sleepInterval

       counter=$((counter+1))

       if [[ $counter -gt $iterations ]]; then
         echo "DSE has not started yet. Setup tables may fail."
         break
       fi
    done
  fi

   dse fs "mkdir checkpoint"          # create checkpoint parent directory
   dse fs "mkdir checkpoint/lab1/"    # create checkpoint directory for lab 1
   dse fs "mkdir checkpoint/lab2a/"   # create checkpoint directory for lab 2a
   dse fs "mkdir checkpoint/lab2b/"   # create checkpoint directory for lab 2b
   dse fs "mkdir checkpoint/lab3piper/"   # create checkpoint directory for lab 3 piper
   dse fs "mkdir checkpoint/lab3goodnews/"   # create checkpoint directory for lab 3 good news handler
   dse fs "mkdir checkpoint/lab2badnews/"   # create checkpoint directory for lab 3 bad news handler

   sleep 10s
fi
echo "Finished creation of Spark Checkpoint Directory"
