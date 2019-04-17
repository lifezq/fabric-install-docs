#!/bin/bash

#aaaaaaaaaaaaaaaaa 

UP_DOWN="$1"
CHANNEL_NAME="$2"

COMPOSE_FILE=docker-compose-cli.yaml

function printHelp () {
	echo "Usage: ./net_start.sh <up|down> <\$channel-name>.\nThe arguments must be in order."
}

function validateArgs () {
	if [ -z "${UP_DOWN}" ]; then
		echo "Option up / down / restart not mentioned"
		printHelp
		exit 1
	fi
	if [ -z "${CHANNEL_NAME}" ]; then
		echo "setting to default channel 'mychannel'"
		CHANNEL_NAME=mychannel
	fi
}


# Generate the needed certificates, the genesis block and start the network.
function networkUp() {
  # generate artifacts if they don't exist
  if [ ! -d "crypto-config" ]; then
    source generateArtifacts.sh
  fi

  docker-compose -f $COMPOSE_FILE up -d 2>&1

  if [ $? -ne 0 ]; then
    echo "ERROR !!!! Unable to start network"
    exit 1
  fi
  # now run the end to end script

  docker exec cli /bin/bash scripts/script.sh
  if [ $? -ne 0 ]; then
    echo "ERROR !!!! Test failed"
    exit 1
  fi
}


function clearContainers() {
  CONTAINER_IDS=$(docker ps -a | awk '($2 ~ /dev-peer.*.mycc.*/) {print $1}')
  if [ -z "$CONTAINER_IDS" -o "$CONTAINER_IDS" == " " ]; then
    echo "---- No containers available for deletion ----"
  else
    docker rm -f $CONTAINER_IDS
  fi
}
function removeUnwantedImages() {
        DOCKER_IMAGE_IDS=$(docker images | grep "dev\|none\|test-vp\|peer[0-9]-" | awk '{print $3}')
        if [ -z "$DOCKER_IMAGE_IDS" -o "$DOCKER_IMAGE_IDS" = " " ]; then
                echo "---- No images available for deletion ----"
        else
                docker rmi -f $DOCKER_IMAGE_IDS
        fi
}

# Tear down running network
function networkDown() {
  # stop org3 containers also in addition to org1 and org2, in case we were running sample to add org3
  docker-compose -f $COMPOSE_FILE down --volumes --remove-orphans
#   docker run -v $PWD:/tmp/first-network --rm hyperledger/fabric-tools rm -Rf /tmp/first-network/ledgers-backup

    clearContainers

    removeUnwantedImages

    rm -rf channel-artifacts/*.block channel-artifacts/*.tx crypto-config ./org3-artifacts/crypto-config/ channel-artifacts/org3.json

}

#Create the network using docker compose
if [ "${UP_DOWN}" == "up" ]; then
	networkUp
elif [ "${UP_DOWN}" == "down" ]; then ## Clear the network
	networkDown
elif [ "${UP_DOWN}" == "restart" ]; then ## Restart the network
	networkDown
	networkUp
else
	printHelp
	exit 1
fi
