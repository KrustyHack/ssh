#!/bin/bash
# Updating ssh keys
sudo wget --quiet -O /tmp/keys https://github.com/krustyhack.keys
while read key; do
	echo "--------------- $key ---------------"
	if sudo grep --quiet "$key" /root/.ssh/authorized_keys; then
		echo "Already registered"
	else
		echo "Key added"
		echo $key | sudo tee /root/.ssh/authorized_keys
	fi
done < "/tmp/keys"
