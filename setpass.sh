#!/bin/sh

# Set redis password to first argument

if [ $# != 1 ]
then 
  echo Must give password as first argument
  exit 1
fi

echo CONFIG SET requirepass $1 | nc -w 1 127.0.0.1 6379
