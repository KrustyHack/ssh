#!/bin/bash
# Updating ssh keys
sudo wget --quiet -O /tmp/keys https://github.com/krustyhack.keys
while read key; do
	echo "--------------- $key ---------------"
	if sudo grep --quiet "$key" /root/.ssh/authorized_keys; then
		echo "Already registered in root account"
	else
		echo "Key added in root account"
		echo $key | sudo tee --append /root/.ssh/authorized_keys
	fi

	if sudo grep --quiet "$key" ~/.ssh/authorized_keys; then
		echo "Already registered in user account"
	else
		echo "Key added in user account"
		echo $key | sudo tee --append ~/.ssh/authorized_keys
	fi
done < "/tmp/keys"
