#!/bin/bash

wget --quiet -O /tmp/keys https://github.com/krustyhack.keys
for key in `cat /tmp/keys`; do
	echo "----- $key -----"
	if grep --quiet "$key" /root/.ssh/authorized_keys; then
		echo "Already registered"
	else
		echo $key >> /root/.ssh/authorized_keys
	fi
done
