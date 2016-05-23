#!/bin/bash


while [[ $# > 1 ]]
do
key="$1"

case $key in
	-n|--nodes)
	NODE_COUNT="$2"
	shift
	;;
	-i|--instance)
	INSTANCE_TYPE="$2"
	shift
	;;
	-a|--ami)
	AMI_ID="$2"
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
	ec2-run-instances $AMI_ID -t $INSTANCE_TYPE -k TomAdmin -g sg-19df7e7e; 
	let NODE_COUNT=NODE_COUNT-1;
	sleep 2;
done

