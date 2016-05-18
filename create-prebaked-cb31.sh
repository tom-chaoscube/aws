#!/bin/bash


while [[ $# > 1 ]]
do
key="$1"

case $key in
	-n|--nodes)
	NODE_COUNT="$2"
	shift
	;;
	*)
	#unknown
	;;
esac
shift
done


while [ $NODE_COUNT -gt 0 ]; do
	echo "creating instance number: " $NODE_COUNT
	ec2-run-instances ami-c55cc9b6 -t t1.micro -k TomAdmin -g sg-19df7e7e;
	let NODE_COUNT=NODE_COUNT-1;
done

