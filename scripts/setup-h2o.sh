#!/bin/bash
source "/vagrant/scripts/common.sh"

function installLocalH2O {
	echo "install sparkling water from local file"
	FILE=/vagrant/resources/$H2O_ARCHIVE
	unzip $FILE -d /usr/local
}

function installRemoteH2O {
	echo "install sparkling water from remote file"
	curl -o /vagrant/resources/$H2O_ARCHIVE -O -L $H2O_MIRROR_DOWNLOAD
	unzip /vagrant/resources/$H2O_ARCHIVE -d /usr/local
}

function installH2O {
	if resourceExists $H2O_ARCHIVE; then
		installLocalH2O
	else
		installRemoteH2O
	fi
	ln -s /usr/local/$H2O_VERSION /usr/local/sparkling-water
}

echo "setup sparkling water"

installH2O

