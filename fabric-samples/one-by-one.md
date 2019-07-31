```
[root@localhost first-network]# ../bin/cryptogen generate --config=./crypto-config.yaml
org1.example.com
org2.example.com
[root@localhost first-network]# ls
base     channel-artifacts  crypto-config       docker-compose-cli.yaml         docker-compose-couch.yaml         docker-compose-org3.yaml  org3-artifacts  scripts
byfn.sh  configtx.yaml      crypto-config.yaml  docker-compose-couch-org3.yaml  docker-compose-e2e-template.yaml  eyfn.sh                   README.md
[root@localhost first-network]# ls channel-artifacts/
[root@localhost first-network]# ../bin/configtxgen -profile TwoOrgsOrdererGenesis -channelID byfn-sys-channel -outputBlock ./channel-artifacts/genesis.block
2019-07-30 14:38:29.802 CST [common/tools/configtxgen] main -> INFO 001 Loading configuration
2019-07-30 14:38:29.815 CST [common/tools/configtxgen/encoder] NewChannelGroup -> WARN 002 Default policy emission is deprecated, please include policy specificiations for the channel group in configtx.yaml
2019-07-30 14:38:29.815 CST [common/tools/configtxgen/encoder] NewOrdererGroup -> WARN 003 Default policy emission is deprecated, please include policy specificiations for the orderer group in configtx.yaml
2019-07-30 14:38:29.816 CST [common/tools/configtxgen/encoder] NewOrdererOrgGroup -> WARN 004 Default policy emission is deprecated, please include policy specificiations for the orderer org group OrdererOrg in configtx.yaml
2019-07-30 14:38:29.816 CST [msp] getMspConfig -> INFO 005 Loading NodeOUs
2019-07-30 14:38:29.816 CST [common/tools/configtxgen/encoder] NewOrdererOrgGroup -> WARN 006 Default policy emission is deprecated, please include policy specificiations for the orderer org group Org1MSP in configtx.yaml
2019-07-30 14:38:29.816 CST [msp] getMspConfig -> INFO 007 Loading NodeOUs
2019-07-30 14:38:29.816 CST [common/tools/configtxgen/encoder] NewOrdererOrgGroup -> WARN 008 Default policy emission is deprecated, please include policy specificiations for the orderer org group Org2MSP in configtx.yaml
2019-07-30 14:38:29.816 CST [common/tools/configtxgen] doOutputBlock -> INFO 009 Generating genesis block
2019-07-30 14:38:29.816 CST [common/tools/configtxgen] doOutputBlock -> INFO 00a Writing genesis block
[root@localhost first-network]# ls channel-artifacts/
genesis.block
[root@localhost first-network]# export CHANNEL_NAME=mychannel  && ../bin/configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID $CHANNEL_NAME
2019-07-30 14:41:03.331 CST [common/tools/configtxgen] main -> INFO 001 Loading configuration
2019-07-30 14:41:03.344 CST [common/tools/configtxgen] doOutputChannelCreateTx -> INFO 002 Generating new channel configtx
2019-07-30 14:41:03.344 CST [common/tools/configtxgen/encoder] NewApplicationGroup -> WARN 003 Default policy emission is deprecated, please include policy specificiations for the application group in configtx.yaml
2019-07-30 14:41:03.345 CST [msp] getMspConfig -> INFO 004 Loading NodeOUs
2019-07-30 14:41:03.345 CST [common/tools/configtxgen/encoder] NewApplicationOrgGroup -> WARN 005 Default policy emission is deprecated, please include policy specificiations for the application org group Org1MSP in configtx.yaml
2019-07-30 14:41:03.346 CST [msp] getMspConfig -> INFO 006 Loading NodeOUs
2019-07-30 14:41:03.346 CST [common/tools/configtxgen/encoder] NewApplicationOrgGroup -> WARN 007 Default policy emission is deprecated, please include policy specificiations for the application org group Org2MSP in configtx.yaml
2019-07-30 14:41:03.348 CST [common/tools/configtxgen] doOutputChannelCreateTx -> INFO 008 Writing new channel tx
[root@localhost first-network]# ../bin/configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org1MSP^C
[root@localhost first-network]# echo $CHANNEL_NAME
mychannel
[root@localhost first-network]# ../bin/configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org1MSP
2019-07-30 14:42:27.530 CST [common/tools/configtxgen] main -> INFO 001 Loading configuration
2019-07-30 14:42:27.544 CST [common/tools/configtxgen] doOutputAnchorPeersUpdate -> INFO 002 Generating anchor peer update
2019-07-30 14:42:27.544 CST [common/tools/configtxgen] doOutputAnchorPeersUpdate -> INFO 003 Writing anchor peer update
[root@localhost first-network]# ../bin/configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org2MSP
2019-07-30 14:42:44.504 CST [common/tools/configtxgen] main -> INFO 001 Loading configuration
2019-07-30 14:42:44.514 CST [common/tools/configtxgen] doOutputAnchorPeersUpdate -> INFO 002 Generating anchor peer update
2019-07-30 14:42:44.515 CST [common/tools/configtxgen] doOutputAnchorPeersUpdate -> INFO 003 Writing anchor peer update
[root@localhost first-network]# vim docker-compose-cli.yaml 
[root@localhost first-network]# docker-compose -f docker-compose-cli.yaml up
Creating network "net_byfn" with the default driver
Creating volume "net_orderer.example.com" with default driver
Creating volume "net_peer0.org1.example.com" with default driver
Creating volume "net_peer1.org1.example.com" with default driver
Creating volume "net_peer0.org2.example.com" with default driver
Creating volume "net_peer1.org2.example.com" with default driver
Creating peer1.org1.example.com ... done
Creating peer1.org2.example.com ... done
Creating orderer.example.com    ... done
Creating peer0.org1.example.com ... done
Creating peer0.org2.example.com ... done
Creating cli                    ... done
Attaching to peer1.org2.example.com, peer1.org1.example.com, peer0.org1.example.com, orderer.example.com, peer0.org2.example.com, cli
peer1.org2.example.com    | 2019-07-30 06:53:24.904 UTC [msp] getMspConfig -> INFO 001 Loading NodeOUs
peer1.org2.example.com    | 2019-07-30 06:53:25.005 UTC [nodeCmd] serve -> INFO 002 Starting peer:
peer1.org2.example.com    |  Version: 1.2.1
peer1.org2.example.com    |  Commit SHA: 5017e4d
peer1.org2.example.com    |  Go version: go1.10
peer1.org2.example.com    |  OS/Arch: linux/amd64
peer1.org2.example.com    |  Experimental features: false
peer1.org2.example.com    |  Chaincode:
peer1.org2.example.com    |   Base Image Version: 0.4.10
peer1.org2.example.com    |   Base Docker Namespace: hyperledger
peer1.org2.example.com    |   Base Docker Label: org.hyperledger.fabric
peer1.org2.example.com    |   Docker Namespace: hyperledger
peer1.org2.example.com    | 
peer1.org2.example.com    | 2019-07-30 06:53:25.005 UTC [ledgermgmt] initialize -> INFO 003 Initializing ledger mgmt
peer1.org2.example.com    | 2019-07-30 06:53:25.005 UTC [kvledger] NewProvider -> INFO 004 Initializing ledger provider
peer1.org2.example.com    | 2019-07-30 06:53:25.120 UTC [kvledger] NewProvider -> INFO 005 ledger provider Initialized
peer1.org2.example.com    | 2019-07-30 06:53:25.120 UTC [ledgermgmt] initialize -> INFO 006 ledger mgmt initialized
peer1.org2.example.com    | 2019-07-30 06:53:25.121 UTC [peer] func1 -> INFO 007 Auto-detected peer address: 172.28.0.2:7051
peer1.org2.example.com    | 2019-07-30 06:53:25.121 UTC [peer] func1 -> INFO 008 Returning peer1.org2.example.com:7051
peer1.org2.example.com    | 2019-07-30 06:53:25.122 UTC [peer] func1 -> INFO 009 Auto-detected peer address: 172.28.0.2:7051
peer1.org2.example.com    | 2019-07-30 06:53:25.122 UTC [peer] func1 -> INFO 00a Returning peer1.org2.example.com:7051
peer1.org2.example.com    | 2019-07-30 06:53:25.124 UTC [nodeCmd] serve -> INFO 00b Starting peer with TLS enabled
peer1.org2.example.com    | 2019-07-30 06:53:25.126 UTC [nodeCmd] computeChaincodeEndpoint -> INFO 00c Entering computeChaincodeEndpoint with peerHostname: peer1.org2.example.com
peer1.org2.example.com    | 2019-07-30 06:53:25.126 UTC [nodeCmd] computeChaincodeEndpoint -> INFO 00d Exit with ccEndpoint: peer1.org2.example.com:7052
peer1.org2.example.com    | 2019-07-30 06:53:25.126 UTC [nodeCmd] createChaincodeServer -> WARN 00e peer.chaincodeListenAddress is not set, using peer1.org2.example.com:7052
peer1.org2.example.com    | 2019-07-30 06:53:25.132 UTC [eventhub_producer] start -> INFO 00f Event processor started
peer1.org2.example.com    | 2019-07-30 06:53:25.137 UTC [sccapi] registerSysCC -> INFO 010 system chaincode cscc(github.com/hyperledger/fabric/core/scc/cscc) registered
peer1.org2.example.com    | 2019-07-30 06:53:25.137 UTC [sccapi] registerSysCC -> INFO 011 system chaincode lscc(github.com/hyperledger/fabric/core/scc/lscc) registered
peer1.org2.example.com    | 2019-07-30 06:53:25.137 UTC [sccapi] registerSysCC -> INFO 012 system chaincode qscc(github.com/hyperledger/fabric/core/scc/qscc) registered
peer1.org2.example.com    | 2019-07-30 06:53:25.140 UTC [gossip/service] func1 -> INFO 013 Initialize gossip with endpoint peer1.org2.example.com:7051 and bootstrap set [peer0.org2.example.com:7051]
peer1.org2.example.com    | 2019-07-30 06:53:25.143 UTC [gossip/gossip] NewGossipService -> INFO 014 Creating gossip service with self membership of {peer1.org2.example.com:7051 [] [76 219 75 109 189 160 53 209 219 119 33 233 196 116 86 119 243 85 59 108 232 14 200 175 196 21 102 180 133 141 22 144] peer1.org2.example.com:7051 <nil> <nil>}
peer1.org2.example.com    | 2019-07-30 06:53:25.150 UTC [gossip/gossip] start -> INFO 015 Gossip instance peer1.org2.example.com:7051 started
peer1.org2.example.com    | 2019-07-30 06:53:25.151 UTC [cscc] Init -> INFO 016 Init CSCC
peer1.org2.example.com    | 2019-07-30 06:53:25.151 UTC [sccapi] deploySysCC -> INFO 017 system chaincode cscc/(github.com/hyperledger/fabric/core/scc/cscc) deployed
peer1.org2.example.com    | 2019-07-30 06:53:25.151 UTC [sccapi] deploySysCC -> INFO 018 system chaincode lscc/(github.com/hyperledger/fabric/core/scc/lscc) deployed
peer1.org2.example.com    | 2019-07-30 06:53:25.157 UTC [qscc] Init -> INFO 019 Init QSCC
peer1.org2.example.com    | 2019-07-30 06:53:25.157 UTC [sccapi] deploySysCC -> INFO 01a system chaincode qscc/(github.com/hyperledger/fabric/core/scc/qscc) deployed
peer1.org2.example.com    | 2019-07-30 06:53:25.157 UTC [nodeCmd] serve -> INFO 01b Deployed system chaincodes
peer1.org2.example.com    | 2019-07-30 06:53:25.158 UTC [discovery] NewService -> INFO 01c Created with config TLS: true, authCacheMaxSize: 1000, authCachePurgeRatio: 0.750000
peer1.org2.example.com    | 2019-07-30 06:53:25.158 UTC [nodeCmd] registerDiscoveryService -> INFO 01d Discovery service activated
peer1.org2.example.com    | 2019-07-30 06:53:25.158 UTC [nodeCmd] serve -> INFO 01e Starting peer with ID=[name:"peer1.org2.example.com" ], network ID=[dev], address=[peer1.org2.example.com:7051]
peer1.org2.example.com    | 2019-07-30 06:53:25.158 UTC [nodeCmd] serve -> INFO 01f Started peer with ID=[name:"peer1.org2.example.com" ], network ID=[dev], address=[peer1.org2.example.com:7051]
peer1.org2.example.com    | 2019-07-30 06:53:25.158 UTC [nodeCmd] func9 -> INFO 020 Starting profiling server with listenAddress = 0.0.0.0:6060
peer1.org1.example.com    | 2019-07-30 06:53:25.349 UTC [msp] getMspConfig -> INFO 001 Loading NodeOUs
peer1.org1.example.com    | 2019-07-30 06:53:25.480 UTC [nodeCmd] serve -> INFO 002 Starting peer:
peer1.org1.example.com    |  Version: 1.2.1
peer1.org1.example.com    |  Commit SHA: 5017e4d
peer1.org1.example.com    |  Go version: go1.10
peer1.org1.example.com    |  OS/Arch: linux/amd64
peer1.org1.example.com    |  Experimental features: false
peer1.org1.example.com    |  Chaincode:
peer1.org1.example.com    |   Base Image Version: 0.4.10
peer1.org1.example.com    |   Base Docker Namespace: hyperledger
peer1.org1.example.com    |   Base Docker Label: org.hyperledger.fabric
peer1.org1.example.com    |   Docker Namespace: hyperledger
peer1.org1.example.com    | 
peer1.org1.example.com    | 2019-07-30 06:53:25.480 UTC [ledgermgmt] initialize -> INFO 003 Initializing ledger mgmt
peer1.org1.example.com    | 2019-07-30 06:53:25.480 UTC [kvledger] NewProvider -> INFO 004 Initializing ledger provider
peer1.org1.example.com    | 2019-07-30 06:53:25.775 UTC [kvledger] NewProvider -> INFO 005 ledger provider Initialized
peer1.org1.example.com    | 2019-07-30 06:53:25.775 UTC [ledgermgmt] initialize -> INFO 006 ledger mgmt initialized
peer1.org1.example.com    | 2019-07-30 06:53:25.775 UTC [peer] func1 -> INFO 007 Auto-detected peer address: 172.28.0.3:7051
peer1.org1.example.com    | 2019-07-30 06:53:25.775 UTC [peer] func1 -> INFO 008 Returning peer1.org1.example.com:7051
peer1.org1.example.com    | 2019-07-30 06:53:25.775 UTC [peer] func1 -> INFO 009 Auto-detected peer address: 172.28.0.3:7051
peer1.org1.example.com    | 2019-07-30 06:53:25.775 UTC [peer] func1 -> INFO 00a Returning peer1.org1.example.com:7051
peer1.org1.example.com    | 2019-07-30 06:53:25.776 UTC [nodeCmd] serve -> INFO 00b Starting peer with TLS enabled
peer1.org1.example.com    | 2019-07-30 06:53:25.810 UTC [eventhub_producer] start -> INFO 00c Event processor started
peer1.org1.example.com    | 2019-07-30 06:53:25.810 UTC [nodeCmd] computeChaincodeEndpoint -> INFO 00d Entering computeChaincodeEndpoint with peerHostname: peer1.org1.example.com
peer1.org1.example.com    | 2019-07-30 06:53:25.810 UTC [nodeCmd] computeChaincodeEndpoint -> INFO 00e Exit with ccEndpoint: peer1.org1.example.com:7052
peer1.org1.example.com    | 2019-07-30 06:53:25.810 UTC [nodeCmd] createChaincodeServer -> WARN 00f peer.chaincodeListenAddress is not set, using peer1.org1.example.com:7052
peer1.org1.example.com    | 2019-07-30 06:53:25.828 UTC [sccapi] registerSysCC -> INFO 010 system chaincode cscc(github.com/hyperledger/fabric/core/scc/cscc) registered
peer1.org1.example.com    | 2019-07-30 06:53:25.828 UTC [sccapi] registerSysCC -> INFO 011 system chaincode lscc(github.com/hyperledger/fabric/core/scc/lscc) registered
peer1.org1.example.com    | 2019-07-30 06:53:25.828 UTC [sccapi] registerSysCC -> INFO 012 system chaincode qscc(github.com/hyperledger/fabric/core/scc/qscc) registered
peer1.org1.example.com    | 2019-07-30 06:53:25.864 UTC [gossip/service] func1 -> INFO 013 Initialize gossip with endpoint peer1.org1.example.com:7051 and bootstrap set [peer0.org1.example.com:7051]
peer1.org1.example.com    | 2019-07-30 06:53:25.878 UTC [gossip/gossip] NewGossipService -> INFO 014 Creating gossip service with self membership of {peer1.org1.example.com:7051 [] [134 185 241 10 36 76 246 189 143 174 195 180 172 255 22 96 60 248 222 75 238 191 108 35 147 158 191 223 23 171 212 98] peer1.org1.example.com:7051 <nil> <nil>}
peer1.org1.example.com    | 2019-07-30 06:53:25.896 UTC [gossip/gossip] start -> INFO 015 Gossip instance peer1.org1.example.com:7051 started
peer1.org1.example.com    | 2019-07-30 06:53:25.902 UTC [cscc] Init -> INFO 016 Init CSCC
peer1.org1.example.com    | 2019-07-30 06:53:25.902 UTC [sccapi] deploySysCC -> INFO 017 system chaincode cscc/(github.com/hyperledger/fabric/core/scc/cscc) deployed
peer1.org1.example.com    | 2019-07-30 06:53:25.910 UTC [sccapi] deploySysCC -> INFO 018 system chaincode lscc/(github.com/hyperledger/fabric/core/scc/lscc) deployed
peer1.org1.example.com    | 2019-07-30 06:53:25.910 UTC [qscc] Init -> INFO 019 Init QSCC
peer1.org1.example.com    | 2019-07-30 06:53:25.910 UTC [sccapi] deploySysCC -> INFO 01a system chaincode qscc/(github.com/hyperledger/fabric/core/scc/qscc) deployed
peer1.org1.example.com    | 2019-07-30 06:53:25.910 UTC [nodeCmd] serve -> INFO 01b Deployed system chaincodes
peer1.org1.example.com    | 2019-07-30 06:53:25.912 UTC [discovery] NewService -> INFO 01c Created with config TLS: true, authCacheMaxSize: 1000, authCachePurgeRatio: 0.750000
peer1.org1.example.com    | 2019-07-30 06:53:25.912 UTC [nodeCmd] registerDiscoveryService -> INFO 01d Discovery service activated
peer1.org1.example.com    | 2019-07-30 06:53:25.912 UTC [nodeCmd] serve -> INFO 01e Starting peer with ID=[name:"peer1.org1.example.com" ], network ID=[dev], address=[peer1.org1.example.com:7051]
peer1.org1.example.com    | 2019-07-30 06:53:25.912 UTC [nodeCmd] serve -> INFO 01f Started peer with ID=[name:"peer1.org1.example.com" ], network ID=[dev], address=[peer1.org1.example.com:7051]
peer1.org1.example.com    | 2019-07-30 06:53:25.912 UTC [nodeCmd] func9 -> INFO 020 Starting profiling server with listenAddress = 0.0.0.0:6060
peer0.org1.example.com    | 2019-07-30 06:53:25.651 UTC [msp] getMspConfig -> INFO 001 Loading NodeOUs
peer0.org1.example.com    | 2019-07-30 06:53:25.796 UTC [nodeCmd] serve -> INFO 002 Starting peer:
peer0.org1.example.com    |  Version: 1.2.1
peer0.org1.example.com    |  Commit SHA: 5017e4d
peer0.org1.example.com    |  Go version: go1.10
peer0.org1.example.com    |  OS/Arch: linux/amd64
peer0.org1.example.com    |  Experimental features: false
peer0.org1.example.com    |  Chaincode:
peer0.org1.example.com    |   Base Image Version: 0.4.10
peer0.org1.example.com    |   Base Docker Namespace: hyperledger
peer0.org1.example.com    |   Base Docker Label: org.hyperledger.fabric
peer0.org1.example.com    |   Docker Namespace: hyperledger
peer0.org1.example.com    | 
peer0.org1.example.com    | 2019-07-30 06:53:25.796 UTC [ledgermgmt] initialize -> INFO 003 Initializing ledger mgmt
peer0.org1.example.com    | 2019-07-30 06:53:25.796 UTC [kvledger] NewProvider -> INFO 004 Initializing ledger provider
peer0.org1.example.com    | 2019-07-30 06:53:25.975 UTC [kvledger] NewProvider -> INFO 005 ledger provider Initialized
peer0.org1.example.com    | 2019-07-30 06:53:25.975 UTC [ledgermgmt] initialize -> INFO 006 ledger mgmt initialized
peer0.org1.example.com    | 2019-07-30 06:53:25.975 UTC [peer] func1 -> INFO 007 Auto-detected peer address: 172.28.0.4:7051
peer0.org1.example.com    | 2019-07-30 06:53:25.975 UTC [peer] func1 -> INFO 008 Returning peer0.org1.example.com:7051
peer0.org1.example.com    | 2019-07-30 06:53:25.975 UTC [peer] func1 -> INFO 009 Auto-detected peer address: 172.28.0.4:7051
peer0.org1.example.com    | 2019-07-30 06:53:25.976 UTC [peer] func1 -> INFO 00a Returning peer0.org1.example.com:7051
peer0.org1.example.com    | 2019-07-30 06:53:25.976 UTC [nodeCmd] serve -> INFO 00b Starting peer with TLS enabled
peer0.org1.example.com    | 2019-07-30 06:53:25.982 UTC [nodeCmd] computeChaincodeEndpoint -> INFO 00c Entering computeChaincodeEndpoint with peerHostname: peer0.org1.example.com
peer0.org1.example.com    | 2019-07-30 06:53:25.982 UTC [nodeCmd] computeChaincodeEndpoint -> INFO 00d Exit with ccEndpoint: peer0.org1.example.com:7052
peer0.org1.example.com    | 2019-07-30 06:53:25.982 UTC [nodeCmd] createChaincodeServer -> WARN 00e peer.chaincodeListenAddress is not set, using peer0.org1.example.com:7052
peer0.org1.example.com    | 2019-07-30 06:53:25.983 UTC [eventhub_producer] start -> INFO 00f Event processor started
peer0.org1.example.com    | 2019-07-30 06:53:25.986 UTC [sccapi] registerSysCC -> INFO 010 system chaincode cscc(github.com/hyperledger/fabric/core/scc/cscc) registered
peer0.org1.example.com    | 2019-07-30 06:53:25.987 UTC [sccapi] registerSysCC -> INFO 011 system chaincode lscc(github.com/hyperledger/fabric/core/scc/lscc) registered
peer0.org1.example.com    | 2019-07-30 06:53:25.987 UTC [sccapi] registerSysCC -> INFO 012 system chaincode qscc(github.com/hyperledger/fabric/core/scc/qscc) registered
peer0.org1.example.com    | 2019-07-30 06:53:25.995 UTC [gossip/service] func1 -> INFO 013 Initialize gossip with endpoint peer0.org1.example.com:7051 and bootstrap set [peer1.org1.example.com:7051]
peer0.org1.example.com    | 2019-07-30 06:53:26.004 UTC [gossip/gossip] NewGossipService -> INFO 014 Creating gossip service with self membership of {peer0.org1.example.com:7051 [] [116 155 96 140 218 178 199 51 7 128 191 33 224 39 46 18 99 149 66 147 175 200 139 43 69 200 32 193 181 207 104 254] peer0.org1.example.com:7051 <nil> <nil>}
peer0.org1.example.com    | 2019-07-30 06:53:26.006 UTC [gossip/gossip] start -> INFO 015 Gossip instance peer0.org1.example.com:7051 started
peer0.org1.example.com    | 2019-07-30 06:53:26.014 UTC [cscc] Init -> INFO 016 Init CSCC
peer0.org1.example.com    | 2019-07-30 06:53:26.014 UTC [sccapi] deploySysCC -> INFO 017 system chaincode cscc/(github.com/hyperledger/fabric/core/scc/cscc) deployed
peer0.org1.example.com    | 2019-07-30 06:53:26.014 UTC [sccapi] deploySysCC -> INFO 018 system chaincode lscc/(github.com/hyperledger/fabric/core/scc/lscc) deployed
peer0.org1.example.com    | 2019-07-30 06:53:26.020 UTC [qscc] Init -> INFO 019 Init QSCC
peer0.org1.example.com    | 2019-07-30 06:53:26.020 UTC [sccapi] deploySysCC -> INFO 01a system chaincode qscc/(github.com/hyperledger/fabric/core/scc/qscc) deployed
peer0.org1.example.com    | 2019-07-30 06:53:26.020 UTC [nodeCmd] serve -> INFO 01b Deployed system chaincodes
peer0.org1.example.com    | 2019-07-30 06:53:26.021 UTC [discovery] NewService -> INFO 01c Created with config TLS: true, authCacheMaxSize: 1000, authCachePurgeRatio: 0.750000
peer0.org1.example.com    | 2019-07-30 06:53:26.021 UTC [nodeCmd] registerDiscoveryService -> INFO 01d Discovery service activated
peer0.org1.example.com    | 2019-07-30 06:53:26.021 UTC [nodeCmd] serve -> INFO 01e Starting peer with ID=[name:"peer0.org1.example.com" ], network ID=[dev], address=[peer0.org1.example.com:7051]
peer0.org1.example.com    | 2019-07-30 06:53:26.021 UTC [nodeCmd] serve -> INFO 01f Started peer with ID=[name:"peer0.org1.example.com" ], network ID=[dev], address=[peer0.org1.example.com:7051]
peer0.org1.example.com    | 2019-07-30 06:53:26.021 UTC [nodeCmd] func9 -> INFO 020 Starting profiling server with listenAddress = 0.0.0.0:6060
orderer.example.com       | 2019-07-30 06:53:25.711 UTC [localconfig] completeInitialization -> INFO 001 Kafka.Version unset, setting to 0.10.2.0
orderer.example.com       | 2019-07-30 06:53:25.861 UTC [orderer/common/server] prettyPrintStruct -> INFO 002 Orderer config values:
orderer.example.com       | 	General.LedgerType = "file"
orderer.example.com       | 	General.ListenAddress = "0.0.0.0"
orderer.example.com       | 	General.ListenPort = 7050
orderer.example.com       | 	General.TLS.Enabled = true
orderer.example.com       | 	General.TLS.PrivateKey = "/var/hyperledger/orderer/tls/server.key"
orderer.example.com       | 	General.TLS.Certificate = "/var/hyperledger/orderer/tls/server.crt"
orderer.example.com       | 	General.TLS.RootCAs = [/var/hyperledger/orderer/tls/ca.crt]
orderer.example.com       | 	General.TLS.ClientAuthRequired = false
orderer.example.com       | 	General.TLS.ClientRootCAs = []
orderer.example.com       | 	General.Keepalive.ServerMinInterval = 1m0s
orderer.example.com       | 	General.Keepalive.ServerInterval = 2h0m0s
orderer.example.com       | 	General.Keepalive.ServerTimeout = 20s
orderer.example.com       | 	General.GenesisMethod = "file"
orderer.example.com       | 	General.GenesisProfile = "SampleInsecureSolo"
orderer.example.com       | 	General.SystemChannel = "test-system-channel-name"
orderer.example.com       | 	General.GenesisFile = "/var/hyperledger/orderer/orderer.genesis.block"
orderer.example.com       | 	General.Profile.Enabled = false
orderer.example.com       | 	General.Profile.Address = "0.0.0.0:6060"
orderer.example.com       | 	General.LogLevel = "INFO"
orderer.example.com       | 	General.LogFormat = "%{color}%{time:2006-01-02 15:04:05.000 MST} [%{module}] %{shortfunc} -> %{level:.4s} %{id:03x}%{color:reset} %{message}"
orderer.example.com       | 	General.LocalMSPDir = "/var/hyperledger/orderer/msp"
orderer.example.com       | 	General.LocalMSPID = "OrdererMSP"
orderer.example.com       | 	General.BCCSP.ProviderName = "SW"
orderer.example.com       | 	General.BCCSP.SwOpts.SecLevel = 256
orderer.example.com       | 	General.BCCSP.SwOpts.HashFamily = "SHA2"
orderer.example.com       | 	General.BCCSP.SwOpts.Ephemeral = false
orderer.example.com       | 	General.BCCSP.SwOpts.FileKeystore.KeyStorePath = "/var/hyperledger/orderer/msp/keystore"
orderer.example.com       | 	General.BCCSP.SwOpts.DummyKeystore =
orderer.example.com       | 	General.BCCSP.PluginOpts =
orderer.example.com       | 	General.Authentication.TimeWindow = 15m0s
orderer.example.com       | 	FileLedger.Location = "/var/hyperledger/production/orderer"
orderer.example.com       | 	FileLedger.Prefix = "hyperledger-fabric-ordererledger"
orderer.example.com       | 	RAMLedger.HistorySize = 1000
orderer.example.com       | 	Kafka.Retry.ShortInterval = 5s
orderer.example.com       | 	Kafka.Retry.ShortTotal = 10m0s
orderer.example.com       | 	Kafka.Retry.LongInterval = 5m0s
orderer.example.com       | 	Kafka.Retry.LongTotal = 12h0m0s
orderer.example.com       | 	Kafka.Retry.NetworkTimeouts.DialTimeout = 10s
orderer.example.com       | 	Kafka.Retry.NetworkTimeouts.ReadTimeout = 10s
orderer.example.com       | 	Kafka.Retry.NetworkTimeouts.WriteTimeout = 10s
orderer.example.com       | 	Kafka.Retry.Metadata.RetryMax = 3
orderer.example.com       | 	Kafka.Retry.Metadata.RetryBackoff = 250ms
orderer.example.com       | 	Kafka.Retry.Producer.RetryMax = 3
orderer.example.com       | 	Kafka.Retry.Producer.RetryBackoff = 100ms
orderer.example.com       | 	Kafka.Retry.Consumer.RetryBackoff = 2s
orderer.example.com       | 	Kafka.Verbose = false
orderer.example.com       | 	Kafka.Version = 0.10.2.0
orderer.example.com       | 	Kafka.TLS.Enabled = false
orderer.example.com       | 	Kafka.TLS.PrivateKey = ""
orderer.example.com       | 	Kafka.TLS.Certificate = ""
orderer.example.com       | 	Kafka.TLS.RootCAs = []
orderer.example.com       | 	Kafka.TLS.ClientAuthRequired = false
orderer.example.com       | 	Kafka.TLS.ClientRootCAs = []
orderer.example.com       | 	Debug.BroadcastTraceDir = ""
orderer.example.com       | 	Debug.DeliverTraceDir = ""
orderer.example.com       | 2019-07-30 06:53:25.861 UTC [orderer/common/server] initializeServerConfig -> INFO 003 Starting orderer with TLS enabled
orderer.example.com       | 2019-07-30 06:53:25.903 UTC [fsblkstorage] newBlockfileMgr -> INFO 004 Getting block information from block storage
orderer.example.com       | 2019-07-30 06:53:25.941 UTC [orderer/commmon/multichannel] NewRegistrar -> INFO 005 Starting system channel 'byfn-sys-channel' with genesis block hash 9aec38f0188abffbf9859ef56a067caacf0b698006d032b4e0d7723c751b7dc1 and orderer type solo
orderer.example.com       | 2019-07-30 06:53:25.941 UTC [orderer/common/server] Start -> INFO 006 Starting orderer:
orderer.example.com       |  Version: 1.2.1
orderer.example.com       |  Commit SHA: 5017e4d
orderer.example.com       |  Go version: go1.10
orderer.example.com       |  OS/Arch: linux/amd64
orderer.example.com       |  Experimental features: false
orderer.example.com       | 2019-07-30 06:53:25.941 UTC [orderer/common/server] Start -> INFO 007 Beginning to serve requests
peer0.org2.example.com    | 2019-07-30 06:53:25.725 UTC [msp] getMspConfig -> INFO 001 Loading NodeOUs
peer0.org2.example.com    | 2019-07-30 06:53:25.871 UTC [nodeCmd] serve -> INFO 002 Starting peer:
peer0.org2.example.com    |  Version: 1.2.1
peer0.org2.example.com    |  Commit SHA: 5017e4d
peer0.org2.example.com    |  Go version: go1.10
peer0.org2.example.com    |  OS/Arch: linux/amd64
peer0.org2.example.com    |  Experimental features: false
peer0.org2.example.com    |  Chaincode:
peer0.org2.example.com    |   Base Image Version: 0.4.10
peer0.org2.example.com    |   Base Docker Namespace: hyperledger
peer0.org2.example.com    |   Base Docker Label: org.hyperledger.fabric
peer0.org2.example.com    |   Docker Namespace: hyperledger
peer0.org2.example.com    | 
peer0.org2.example.com    | 2019-07-30 06:53:25.872 UTC [ledgermgmt] initialize -> INFO 003 Initializing ledger mgmt
peer0.org2.example.com    | 2019-07-30 06:53:25.872 UTC [kvledger] NewProvider -> INFO 004 Initializing ledger provider
peer0.org2.example.com    | 2019-07-30 06:53:26.079 UTC [kvledger] NewProvider -> INFO 005 ledger provider Initialized
peer0.org2.example.com    | 2019-07-30 06:53:26.079 UTC [ledgermgmt] initialize -> INFO 006 ledger mgmt initialized
peer0.org2.example.com    | 2019-07-30 06:53:26.079 UTC [peer] func1 -> INFO 007 Auto-detected peer address: 172.28.0.5:7051
peer0.org2.example.com    | 2019-07-30 06:53:26.080 UTC [peer] func1 -> INFO 008 Returning peer0.org2.example.com:7051
peer0.org2.example.com    | 2019-07-30 06:53:26.080 UTC [peer] func1 -> INFO 009 Auto-detected peer address: 172.28.0.5:7051
peer0.org2.example.com    | 2019-07-30 06:53:26.080 UTC [peer] func1 -> INFO 00a Returning peer0.org2.example.com:7051
peer0.org2.example.com    | 2019-07-30 06:53:26.081 UTC [nodeCmd] serve -> INFO 00b Starting peer with TLS enabled
peer0.org2.example.com    | 2019-07-30 06:53:26.085 UTC [nodeCmd] computeChaincodeEndpoint -> INFO 00c Entering computeChaincodeEndpoint with peerHostname: peer0.org2.example.com
peer0.org2.example.com    | 2019-07-30 06:53:26.085 UTC [nodeCmd] computeChaincodeEndpoint -> INFO 00d Exit with ccEndpoint: peer0.org2.example.com:7052
peer0.org2.example.com    | 2019-07-30 06:53:26.086 UTC [nodeCmd] createChaincodeServer -> WARN 00e peer.chaincodeListenAddress is not set, using peer0.org2.example.com:7052
peer0.org2.example.com    | 2019-07-30 06:53:26.087 UTC [eventhub_producer] start -> INFO 00f Event processor started
peer0.org2.example.com    | 2019-07-30 06:53:26.092 UTC [sccapi] registerSysCC -> INFO 010 system chaincode cscc(github.com/hyperledger/fabric/core/scc/cscc) registered
peer0.org2.example.com    | 2019-07-30 06:53:26.092 UTC [sccapi] registerSysCC -> INFO 011 system chaincode lscc(github.com/hyperledger/fabric/core/scc/lscc) registered
peer0.org2.example.com    | 2019-07-30 06:53:26.092 UTC [sccapi] registerSysCC -> INFO 012 system chaincode qscc(github.com/hyperledger/fabric/core/scc/qscc) registered
peer0.org2.example.com    | 2019-07-30 06:53:26.094 UTC [gossip/service] func1 -> INFO 013 Initialize gossip with endpoint peer0.org2.example.com:7051 and bootstrap set [peer1.org2.example.com:7051]
peer0.org2.example.com    | 2019-07-30 06:53:26.099 UTC [gossip/gossip] NewGossipService -> INFO 014 Creating gossip service with self membership of {peer0.org2.example.com:7051 [] [63 47 188 40 187 147 229 47 145 8 163 203 252 131 104 140 158 193 223 231 134 164 99 199 28 97 3 32 246 204 97 193] peer0.org2.example.com:7051 <nil> <nil>}
peer0.org2.example.com    | 2019-07-30 06:53:26.105 UTC [gossip/gossip] start -> INFO 015 Gossip instance peer0.org2.example.com:7051 started
peer0.org2.example.com    | 2019-07-30 06:53:26.109 UTC [cscc] Init -> INFO 016 Init CSCC
peer0.org2.example.com    | 2019-07-30 06:53:26.109 UTC [sccapi] deploySysCC -> INFO 017 system chaincode cscc/(github.com/hyperledger/fabric/core/scc/cscc) deployed
peer0.org2.example.com    | 2019-07-30 06:53:26.109 UTC [sccapi] deploySysCC -> INFO 018 system chaincode lscc/(github.com/hyperledger/fabric/core/scc/lscc) deployed
peer0.org2.example.com    | 2019-07-30 06:53:26.109 UTC [qscc] Init -> INFO 019 Init QSCC
peer0.org2.example.com    | 2019-07-30 06:53:26.110 UTC [sccapi] deploySysCC -> INFO 01a system chaincode qscc/(github.com/hyperledger/fabric/core/scc/qscc) deployed
peer0.org2.example.com    | 2019-07-30 06:53:26.110 UTC [nodeCmd] serve -> INFO 01b Deployed system chaincodes
peer0.org2.example.com    | 2019-07-30 06:53:26.110 UTC [discovery] NewService -> INFO 01c Created with config TLS: true, authCacheMaxSize: 1000, authCachePurgeRatio: 0.750000
peer0.org2.example.com    | 2019-07-30 06:53:26.110 UTC [nodeCmd] registerDiscoveryService -> INFO 01d Discovery service activated
peer0.org2.example.com    | 2019-07-30 06:53:26.111 UTC [nodeCmd] serve -> INFO 01e Starting peer with ID=[name:"peer0.org2.example.com" ], network ID=[dev], address=[peer0.org2.example.com:7051]
peer0.org2.example.com    | 2019-07-30 06:53:26.111 UTC [nodeCmd] serve -> INFO 01f Started peer with ID=[name:"peer0.org2.example.com" ], network ID=[dev], address=[peer0.org2.example.com:7051]
peer0.org2.example.com    | 2019-07-30 06:53:26.111 UTC [nodeCmd] func9 -> INFO 020 Starting profiling server with listenAddress = 0.0.0.0:6060

[root@localhost first-network]# docker exec -it cli bash
root@b4f4cea1edb0:/opt/gopath/src/github.com/hyperledger/fabric/peer# ls
channel-artifacts  crypto  scripts
root@b4f4cea1edb0:/opt/gopath/src/github.com/hyperledger/fabric/peer# echo $CORE_PEER_MSPCONFIGPATH
/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
root@b4f4cea1edb0:/opt/gopath/src/github.com/hyperledger/fabric/peer# echo $CHANNEL_NAME

root@b4f4cea1edb0:/opt/gopath/src/github.com/hyperledger/fabric/peer# export CHANNEL_NAME=mychannel
root@b4f4cea1edb0:/opt/gopath/src/github.com/hyperledger/fabric/peer# echo $CHANNEL_NAME
mychannel
root@b4f4cea1edb0:/opt/gopath/src/github.com/hyperledger/fabric/peer# peer channel create -o orderer.example.com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/channel.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
2019-07-30 07:04:00.637 UTC [viperutil] getKeysRecursively -> DEBU 001 Found map[string]interface{} value for peer.BCCSP
2019-07-30 07:04:00.637 UTC [viperutil] getKeysRecursively -> DEBU 002 Found map[string]interface{} value for peer.BCCSP.PKCS11
2019-07-30 07:04:00.637 UTC [viperutil] getKeysRecursively -> DEBU 003 Found map[string]interface{} value for peer.BCCSP.PKCS11.FileKeyStore
2019-07-30 07:04:00.637 UTC [viperutil] unmarshalJSON -> DEBU 004 Unmarshal JSON: value is not a string: <nil>
2019-07-30 07:04:00.638 UTC [viperutil] getKeysRecursively -> DEBU 005 Found real value for peer.BCCSP.PKCS11.FileKeyStore.KeyStore setting to <nil> <nil>
2019-07-30 07:04:00.638 UTC [viperutil] unmarshalJSON -> DEBU 006 Unmarshal JSON: value is not a string: <nil>
2019-07-30 07:04:00.638 UTC [viperutil] getKeysRecursively -> DEBU 007 Found real value for peer.BCCSP.PKCS11.Library setting to <nil> <nil>
2019-07-30 07:04:00.638 UTC [viperutil] unmarshalJSON -> DEBU 008 Unmarshal JSON: value is not a string: <nil>
2019-07-30 07:04:00.638 UTC [viperutil] getKeysRecursively -> DEBU 009 Found real value for peer.BCCSP.PKCS11.Label setting to <nil> <nil>
2019-07-30 07:04:00.639 UTC [viperutil] unmarshalJSON -> DEBU 00a Unmarshal JSON: value is not a string: <nil>
2019-07-30 07:04:00.639 UTC [viperutil] getKeysRecursively -> DEBU 00b Found real value for peer.BCCSP.PKCS11.Pin setting to <nil> <nil>
2019-07-30 07:04:00.639 UTC [viperutil] unmarshalJSON -> DEBU 00c Unmarshal JSON: value is not a string: <nil>
2019-07-30 07:04:00.639 UTC [viperutil] getKeysRecursively -> DEBU 00d Found real value for peer.BCCSP.PKCS11.Hash setting to <nil> <nil>
2019-07-30 07:04:00.639 UTC [viperutil] unmarshalJSON -> DEBU 00e Unmarshal JSON: value is not a string: <nil>
2019-07-30 07:04:00.639 UTC [viperutil] getKeysRecursively -> DEBU 00f Found real value for peer.BCCSP.PKCS11.Security setting to <nil> <nil>
2019-07-30 07:04:00.640 UTC [viperutil] unmarshalJSON -> DEBU 010 Unmarshal JSON: value cannot be unmarshalled: invalid character 'S' looking for beginning of value
2019-07-30 07:04:00.640 UTC [viperutil] getKeysRecursively -> DEBU 011 Found real value for peer.BCCSP.Default setting to string SW
2019-07-30 07:04:00.640 UTC [viperutil] getKeysRecursively -> DEBU 012 Found map[string]interface{} value for peer.BCCSP.SW
2019-07-30 07:04:00.640 UTC [viperutil] unmarshalJSON -> DEBU 013 Unmarshal JSON: value cannot be unmarshalled: invalid character 'S' looking for beginning of value
2019-07-30 07:04:00.640 UTC [viperutil] getKeysRecursively -> DEBU 014 Found real value for peer.BCCSP.SW.Hash setting to string SHA2
2019-07-30 07:04:00.640 UTC [viperutil] unmarshalJSON -> DEBU 015 Unmarshal JSON: value is not a string: 256
2019-07-30 07:04:00.640 UTC [viperutil] getKeysRecursively -> DEBU 016 Found real value for peer.BCCSP.SW.Security setting to int 256
2019-07-30 07:04:00.640 UTC [viperutil] getKeysRecursively -> DEBU 017 Found map[string]interface{} value for peer.BCCSP.SW.FileKeyStore
2019-07-30 07:04:00.640 UTC [viperutil] unmarshalJSON -> DEBU 018 Unmarshal JSON: value cannot be unmarshalled: unexpected end of JSON input
2019-07-30 07:04:00.640 UTC [viperutil] getKeysRecursively -> DEBU 019 Found real value for peer.BCCSP.SW.FileKeyStore.KeyStore setting to string 
2019-07-30 07:04:00.640 UTC [viperutil] EnhancedExactUnmarshalKey -> DEBU 01a map[peer.BCCSP:map[PKCS11:map[Library:<nil> Label:<nil> Pin:<nil> Hash:<nil> Security:<nil> FileKeyStore:map[KeyStore:<nil>]] Default:SW SW:map[Hash:SHA2 Security:256 FileKeyStore:map[KeyStore:]]]]
2019-07-30 07:04:00.640 UTC [bccsp_sw] openKeyStore -> DEBU 01b KeyStore opened at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore]...done
2019-07-30 07:04:00.641 UTC [bccsp] initBCCSP -> DEBU 01c Initialize BCCSP [SW]
2019-07-30 07:04:00.641 UTC [msp] getPemMaterialFromDir -> DEBU 01d Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts
2019-07-30 07:04:00.641 UTC [msp] getPemMaterialFromDir -> DEBU 01e Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts/Admin@org1.example.com-cert.pem
2019-07-30 07:04:00.641 UTC [msp] getPemMaterialFromDir -> DEBU 01f Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/cacerts
2019-07-30 07:04:00.641 UTC [msp] getPemMaterialFromDir -> DEBU 020 Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/cacerts/ca.org1.example.com-cert.pem
2019-07-30 07:04:00.641 UTC [msp] getPemMaterialFromDir -> DEBU 021 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/admincerts
2019-07-30 07:04:00.641 UTC [msp] getPemMaterialFromDir -> DEBU 022 Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/admincerts/Admin@org1.example.com-cert.pem
2019-07-30 07:04:00.641 UTC [msp] getPemMaterialFromDir -> DEBU 023 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/intermediatecerts
2019-07-30 07:04:00.642 UTC [msp] getMspConfig -> DEBU 024 Intermediate certs folder not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/intermediatecerts]. Skipping. [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/intermediatecerts: no such file or directory]
2019-07-30 07:04:00.642 UTC [msp] getPemMaterialFromDir -> DEBU 025 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/tlscacerts
2019-07-30 07:04:00.642 UTC [msp] getPemMaterialFromDir -> DEBU 026 Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/tlscacerts/tlsca.org1.example.com-cert.pem
2019-07-30 07:04:00.642 UTC [msp] getPemMaterialFromDir -> DEBU 027 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/tlsintermediatecerts
2019-07-30 07:04:00.642 UTC [msp] getMspConfig -> DEBU 028 TLS intermediate certs folder not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/tlsintermediatecerts]. Skipping. [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/tlsintermediatecerts: no such file or directory]
2019-07-30 07:04:00.642 UTC [msp] getPemMaterialFromDir -> DEBU 029 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/crls
2019-07-30 07:04:00.642 UTC [msp] getMspConfig -> DEBU 02a crls folder not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/crls]. Skipping. [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/crls: no such file or directory]
2019-07-30 07:04:00.642 UTC [msp] getMspConfig -> DEBU 02b MSP configuration file not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/config.yaml]: [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/config.yaml: no such file or directory]
2019-07-30 07:04:00.642 UTC [msp] newBccspMsp -> DEBU 02c Creating BCCSP-based MSP instance
2019-07-30 07:04:00.642 UTC [msp] New -> DEBU 02d Creating Cache-MSP instance
2019-07-30 07:04:00.642 UTC [msp] loadLocaMSP -> DEBU 02e Created new local MSP
2019-07-30 07:04:00.642 UTC [msp] Setup -> DEBU 02f Setting up MSP instance Org1MSP
2019-07-30 07:04:00.643 UTC [msp/identity] newIdentity -> DEBU 030 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICRDCCAeqgAwIBAgIRAIGmB76u4bI3ctUs4QfOeFcwCgYIKoZIzj0EAwIwczEL
MAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBG
cmFuY2lzY28xGTAXBgNVBAoTEG9yZzEuZXhhbXBsZS5jb20xHDAaBgNVBAMTE2Nh
Lm9yZzEuZXhhbXBsZS5jb20wHhcNMTkwNzMwMDYzMzEzWhcNMjkwNzI3MDYzMzEz
WjBzMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMN
U2FuIEZyYW5jaXNjbzEZMBcGA1UEChMQb3JnMS5leGFtcGxlLmNvbTEcMBoGA1UE
AxMTY2Eub3JnMS5leGFtcGxlLmNvbTBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IA
BAST5/G8QgME/QJDMQv6BBhfWIzA4Wxcg4Ruppn7+OxeUTUWfJ2kRaUVp1EMC58W
tf7W5PAmqnJrH5PyFazzvpSjXzBdMA4GA1UdDwEB/wQEAwIBpjAPBgNVHSUECDAG
BgRVHSUAMA8GA1UdEwEB/wQFMAMBAf8wKQYDVR0OBCIEINeglHdwXpkuzhJRc1/f
Gt4l4aFjVNul2jbx2Zcu7rYuMAoGCCqGSM49BAMCA0gAMEUCIQDxGU9rA6GTtL2s
WTLcUShQ0pGnoD5HjHDqMsP5EWrhDgIgNAo3LAHJN2gb42msgSYw6xNbyDu/R0go
/Vzw5OskaTY=
-----END CERTIFICATE-----
2019-07-30 07:04:00.644 UTC [msp/identity] newIdentity -> DEBU 031 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICKzCCAdGgAwIBAgIRAL33HdqIRq7GVsrvn8ZzkbUwCgYIKoZIzj0EAwIwczEL
MAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBG
cmFuY2lzY28xGTAXBgNVBAoTEG9yZzEuZXhhbXBsZS5jb20xHDAaBgNVBAMTE2Nh
Lm9yZzEuZXhhbXBsZS5jb20wHhcNMTkwNzMwMDYzMzEzWhcNMjkwNzI3MDYzMzEz
WjBsMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMN
U2FuIEZyYW5jaXNjbzEPMA0GA1UECxMGY2xpZW50MR8wHQYDVQQDDBZBZG1pbkBv
cmcxLmV4YW1wbGUuY29tMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE/qgU40TV
sxbFg21jVRvlx114TvdAK6BhfDG2ECbRJ48KAeSK95E6dp8Qte49U+uXFJ0pvtKF
9xvZje8BU+8xaaNNMEswDgYDVR0PAQH/BAQDAgeAMAwGA1UdEwEB/wQCMAAwKwYD
VR0jBCQwIoAg16CUd3BemS7OElFzX98a3iXhoWNU26XaNvHZly7uti4wCgYIKoZI
zj0EAwIDSAAwRQIhAJL0PbcdD5imGeEUGgBbxJrCdfPp8ceWG/skkuc+yDmLAiAI
KyjJVssdfN1mvLCeVhBFU5XrYs2kR4QpXkn4YmtrwQ==
-----END CERTIFICATE-----
2019-07-30 07:04:00.662 UTC [msp/identity] newIdentity -> DEBU 032 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICKzCCAdGgAwIBAgIRAL33HdqIRq7GVsrvn8ZzkbUwCgYIKoZIzj0EAwIwczEL
MAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBG
cmFuY2lzY28xGTAXBgNVBAoTEG9yZzEuZXhhbXBsZS5jb20xHDAaBgNVBAMTE2Nh
Lm9yZzEuZXhhbXBsZS5jb20wHhcNMTkwNzMwMDYzMzEzWhcNMjkwNzI3MDYzMzEz
WjBsMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMN
U2FuIEZyYW5jaXNjbzEPMA0GA1UECxMGY2xpZW50MR8wHQYDVQQDDBZBZG1pbkBv
cmcxLmV4YW1wbGUuY29tMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE/qgU40TV
sxbFg21jVRvlx114TvdAK6BhfDG2ECbRJ48KAeSK95E6dp8Qte49U+uXFJ0pvtKF
9xvZje8BU+8xaaNNMEswDgYDVR0PAQH/BAQDAgeAMAwGA1UdEwEB/wQCMAAwKwYD
VR0jBCQwIoAg16CUd3BemS7OElFzX98a3iXhoWNU26XaNvHZly7uti4wCgYIKoZI
zj0EAwIDSAAwRQIhAJL0PbcdD5imGeEUGgBbxJrCdfPp8ceWG/skkuc+yDmLAiAI
KyjJVssdfN1mvLCeVhBFU5XrYs2kR4QpXkn4YmtrwQ==
-----END CERTIFICATE-----
2019-07-30 07:04:00.664 UTC [bccsp_sw] loadPrivateKey -> DEBU 033 Loading private key [f31e0521aa582cb638ae53f074379212d1cab384b977da607580ff2707cba9cf] at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/f31e0521aa582cb638ae53f074379212d1cab384b977da607580ff2707cba9cf_sk]...
2019-07-30 07:04:00.666 UTC [msp/identity] newIdentity -> DEBU 034 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICKzCCAdGgAwIBAgIRAL33HdqIRq7GVsrvn8ZzkbUwCgYIKoZIzj0EAwIwczEL
MAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBG
cmFuY2lzY28xGTAXBgNVBAoTEG9yZzEuZXhhbXBsZS5jb20xHDAaBgNVBAMTE2Nh
Lm9yZzEuZXhhbXBsZS5jb20wHhcNMTkwNzMwMDYzMzEzWhcNMjkwNzI3MDYzMzEz
WjBsMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMN
U2FuIEZyYW5jaXNjbzEPMA0GA1UECxMGY2xpZW50MR8wHQYDVQQDDBZBZG1pbkBv
cmcxLmV4YW1wbGUuY29tMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE/qgU40TV
sxbFg21jVRvlx114TvdAK6BhfDG2ECbRJ48KAeSK95E6dp8Qte49U+uXFJ0pvtKF
9xvZje8BU+8xaaNNMEswDgYDVR0PAQH/BAQDAgeAMAwGA1UdEwEB/wQCMAAwKwYD
VR0jBCQwIoAg16CUd3BemS7OElFzX98a3iXhoWNU26XaNvHZly7uti4wCgYIKoZI
zj0EAwIDSAAwRQIhAJL0PbcdD5imGeEUGgBbxJrCdfPp8ceWG/skkuc+yDmLAiAI
KyjJVssdfN1mvLCeVhBFU5XrYs2kR4QpXkn4YmtrwQ==
-----END CERTIFICATE-----
2019-07-30 07:04:00.666 UTC [msp] setupSigningIdentity -> DEBU 035 Signing identity expires at 2029-07-27 06:33:13 +0000 UTC
2019-07-30 07:04:00.666 UTC [msp] Validate -> DEBU 036 MSP Org1MSP validating identity
2019-07-30 07:04:00.666 UTC [msp] GetDefaultSigningIdentity -> DEBU 037 Obtaining default signing identity
2019-07-30 07:04:00.667 UTC [grpc] Printf -> DEBU 038 parsed scheme: ""
2019-07-30 07:04:00.667 UTC [grpc] Printf -> DEBU 039 scheme "" not registered, fallback to default scheme
2019-07-30 07:04:00.667 UTC [grpc] Printf -> DEBU 03a ccResolverWrapper: sending new addresses to cc: [{orderer.example.com:7050 0  <nil>}]
2019-07-30 07:04:00.667 UTC [grpc] Printf -> DEBU 03b ClientConn switching balancer to "pick_first"
2019-07-30 07:04:00.667 UTC [grpc] Printf -> DEBU 03c pickfirstBalancer: HandleSubConnStateChange: 0xc420172ac0, CONNECTING
2019-07-30 07:04:00.670 UTC [grpc] Printf -> DEBU 03d pickfirstBalancer: HandleSubConnStateChange: 0xc420172ac0, READY
2019-07-30 07:04:00.670 UTC [channelCmd] InitCmdFactory -> INFO 03e Endorser and orderer connections initialized
2019-07-30 07:04:00.670 UTC [msp] GetDefaultSigningIdentity -> DEBU 03f Obtaining default signing identity
2019-07-30 07:04:00.670 UTC [msp] GetDefaultSigningIdentity -> DEBU 040 Obtaining default signing identity
2019-07-30 07:04:00.670 UTC [msp/identity] Sign -> DEBU 041 Sign: plaintext: 0ABA060A074F7267314D535012AE062D...53616D706C65436F6E736F727469756D 
2019-07-30 07:04:00.670 UTC [msp/identity] Sign -> DEBU 042 Sign: digest: FF636E1D740287E6E1F3AF33F3CEACE6CB88B6AD4278E930EAE7D473700C8988 
2019-07-30 07:04:00.670 UTC [msp] GetDefaultSigningIdentity -> DEBU 043 Obtaining default signing identity
2019-07-30 07:04:00.670 UTC [msp] GetDefaultSigningIdentity -> DEBU 044 Obtaining default signing identity
2019-07-30 07:04:00.670 UTC [msp/identity] Sign -> DEBU 045 Sign: plaintext: 0AF1060A1508021A0608E0D7FFE90522...7836D2C5FCF6B028821CB0CD3F4411A2 
2019-07-30 07:04:00.670 UTC [msp/identity] Sign -> DEBU 046 Sign: digest: 3CB41F142D306A72E49AB803C898C80FE96A155A39B09DDA83F8252EF507069D 
2019-07-30 07:04:00.671 UTC [grpc] Printf -> DEBU 047 parsed scheme: ""
2019-07-30 07:04:00.671 UTC [grpc] Printf -> DEBU 048 scheme "" not registered, fallback to default scheme
2019-07-30 07:04:00.671 UTC [grpc] Printf -> DEBU 049 ccResolverWrapper: sending new addresses to cc: [{orderer.example.com:7050 0  <nil>}]
2019-07-30 07:04:00.671 UTC [grpc] Printf -> DEBU 04a ClientConn switching balancer to "pick_first"
2019-07-30 07:04:00.671 UTC [grpc] Printf -> DEBU 04b pickfirstBalancer: HandleSubConnStateChange: 0xc420173fb0, CONNECTING
2019-07-30 07:04:00.673 UTC [grpc] Printf -> DEBU 04c pickfirstBalancer: HandleSubConnStateChange: 0xc420173fb0, READY
2019-07-30 07:04:00.711 UTC [msp] GetDefaultSigningIdentity -> DEBU 04d Obtaining default signing identity
2019-07-30 07:04:00.711 UTC [msp] GetDefaultSigningIdentity -> DEBU 04e Obtaining default signing identity
2019-07-30 07:04:00.711 UTC [msp/identity] Sign -> DEBU 04f Sign: plaintext: 0AF1060A1508051A0608E0D7FFE90522...7B7B8D323DA112080A021A0012021A00 
2019-07-30 07:04:00.711 UTC [msp/identity] Sign -> DEBU 050 Sign: digest: C717A55695BC60962802442EAFB2F781A65438BEE9238D2B29A45ECA7379F896 
2019-07-30 07:04:00.718 UTC [cli/common] readBlock -> INFO 051 Got status: &{NOT_FOUND}
2019-07-30 07:04:00.718 UTC [msp] GetDefaultSigningIdentity -> DEBU 052 Obtaining default signing identity
2019-07-30 07:04:00.719 UTC [grpc] Printf -> DEBU 053 parsed scheme: ""
2019-07-30 07:04:00.719 UTC [grpc] Printf -> DEBU 054 scheme "" not registered, fallback to default scheme
2019-07-30 07:04:00.719 UTC [grpc] Printf -> DEBU 055 ccResolverWrapper: sending new addresses to cc: [{orderer.example.com:7050 0  <nil>}]
2019-07-30 07:04:00.719 UTC [grpc] Printf -> DEBU 056 ClientConn switching balancer to "pick_first"
2019-07-30 07:04:00.719 UTC [grpc] Printf -> DEBU 057 pickfirstBalancer: HandleSubConnStateChange: 0xc4205532a0, CONNECTING
2019-07-30 07:04:00.721 UTC [grpc] Printf -> DEBU 058 pickfirstBalancer: HandleSubConnStateChange: 0xc4205532a0, READY
2019-07-30 07:04:00.721 UTC [channelCmd] InitCmdFactory -> INFO 059 Endorser and orderer connections initialized
2019-07-30 07:04:00.922 UTC [msp] GetDefaultSigningIdentity -> DEBU 05a Obtaining default signing identity
2019-07-30 07:04:00.922 UTC [msp] GetDefaultSigningIdentity -> DEBU 05b Obtaining default signing identity
2019-07-30 07:04:00.922 UTC [msp/identity] Sign -> DEBU 05c Sign: plaintext: 0AF1060A1508051A0608E0D7FFE90522...1310A08F397312080A021A0012021A00 
2019-07-30 07:04:00.922 UTC [msp/identity] Sign -> DEBU 05d Sign: digest: 9821B0EDA00194BE3BF2A4A2879476C938F01EF02953C9BDD87D6033610107EC 
2019-07-30 07:04:00.928 UTC [cli/common] readBlock -> INFO 05e Received block: 0

root@b4f4cea1edb0:/opt/gopath/src/github.com/hyperledger/fabric/peer# ls
channel-artifacts  crypto  mychannel.block  scripts
root@b4f4cea1edb0:/opt/gopath/src/github.com/hyperledger/fabric/peer# peer channel join -b mychannel.block
2019-07-30 07:31:39.403 UTC [viperutil] getKeysRecursively -> DEBU 001 Found map[string]interface{} value for peer.BCCSP
2019-07-30 07:31:39.403 UTC [viperutil] getKeysRecursively -> DEBU 002 Found map[string]interface{} value for peer.BCCSP.SW
2019-07-30 07:31:39.404 UTC [viperutil] unmarshalJSON -> DEBU 003 Unmarshal JSON: value cannot be unmarshalled: invalid character 'S' looking for beginning of value
2019-07-30 07:31:39.404 UTC [viperutil] getKeysRecursively -> DEBU 004 Found real value for peer.BCCSP.SW.Hash setting to string SHA2
2019-07-30 07:31:39.404 UTC [viperutil] unmarshalJSON -> DEBU 005 Unmarshal JSON: value is not a string: 256
2019-07-30 07:31:39.404 UTC [viperutil] getKeysRecursively -> DEBU 006 Found real value for peer.BCCSP.SW.Security setting to int 256
2019-07-30 07:31:39.404 UTC [viperutil] getKeysRecursively -> DEBU 007 Found map[string]interface{} value for peer.BCCSP.SW.FileKeyStore
2019-07-30 07:31:39.404 UTC [viperutil] unmarshalJSON -> DEBU 008 Unmarshal JSON: value cannot be unmarshalled: unexpected end of JSON input
2019-07-30 07:31:39.404 UTC [viperutil] getKeysRecursively -> DEBU 009 Found real value for peer.BCCSP.SW.FileKeyStore.KeyStore setting to string 
2019-07-30 07:31:39.404 UTC [viperutil] getKeysRecursively -> DEBU 00a Found map[string]interface{} value for peer.BCCSP.PKCS11
2019-07-30 07:31:39.404 UTC [viperutil] unmarshalJSON -> DEBU 00b Unmarshal JSON: value is not a string: <nil>
2019-07-30 07:31:39.404 UTC [viperutil] getKeysRecursively -> DEBU 00c Found real value for peer.BCCSP.PKCS11.Hash setting to <nil> <nil>
2019-07-30 07:31:39.404 UTC [viperutil] unmarshalJSON -> DEBU 00d Unmarshal JSON: value is not a string: <nil>
2019-07-30 07:31:39.405 UTC [viperutil] getKeysRecursively -> DEBU 00e Found real value for peer.BCCSP.PKCS11.Security setting to <nil> <nil>
2019-07-30 07:31:39.405 UTC [viperutil] getKeysRecursively -> DEBU 00f Found map[string]interface{} value for peer.BCCSP.PKCS11.FileKeyStore
2019-07-30 07:31:39.405 UTC [viperutil] unmarshalJSON -> DEBU 010 Unmarshal JSON: value is not a string: <nil>
2019-07-30 07:31:39.405 UTC [viperutil] getKeysRecursively -> DEBU 011 Found real value for peer.BCCSP.PKCS11.FileKeyStore.KeyStore setting to <nil> <nil>
2019-07-30 07:31:39.411 UTC [viperutil] unmarshalJSON -> DEBU 012 Unmarshal JSON: value is not a string: <nil>
2019-07-30 07:31:39.411 UTC [viperutil] getKeysRecursively -> DEBU 013 Found real value for peer.BCCSP.PKCS11.Library setting to <nil> <nil>
2019-07-30 07:31:39.412 UTC [viperutil] unmarshalJSON -> DEBU 014 Unmarshal JSON: value is not a string: <nil>
2019-07-30 07:31:39.412 UTC [viperutil] getKeysRecursively -> DEBU 015 Found real value for peer.BCCSP.PKCS11.Label setting to <nil> <nil>
2019-07-30 07:31:39.412 UTC [viperutil] unmarshalJSON -> DEBU 016 Unmarshal JSON: value is not a string: <nil>
2019-07-30 07:31:39.412 UTC [viperutil] getKeysRecursively -> DEBU 017 Found real value for peer.BCCSP.PKCS11.Pin setting to <nil> <nil>
2019-07-30 07:31:39.412 UTC [viperutil] unmarshalJSON -> DEBU 018 Unmarshal JSON: value cannot be unmarshalled: invalid character 'S' looking for beginning of value
2019-07-30 07:31:39.412 UTC [viperutil] getKeysRecursively -> DEBU 019 Found real value for peer.BCCSP.Default setting to string SW
2019-07-30 07:31:39.412 UTC [viperutil] EnhancedExactUnmarshalKey -> DEBU 01a map[peer.BCCSP:map[SW:map[Hash:SHA2 Security:256 FileKeyStore:map[KeyStore:]] PKCS11:map[Library:<nil> Label:<nil> Pin:<nil> Hash:<nil> Security:<nil> FileKeyStore:map[KeyStore:<nil>]] Default:SW]]
2019-07-30 07:31:39.413 UTC [bccsp_sw] openKeyStore -> DEBU 01b KeyStore opened at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore]...done
2019-07-30 07:31:39.413 UTC [bccsp] initBCCSP -> DEBU 01c Initialize BCCSP [SW]
2019-07-30 07:31:39.413 UTC [msp] getPemMaterialFromDir -> DEBU 01d Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts
2019-07-30 07:31:39.414 UTC [msp] getPemMaterialFromDir -> DEBU 01e Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts/Admin@org1.example.com-cert.pem
2019-07-30 07:31:39.414 UTC [msp] getPemMaterialFromDir -> DEBU 01f Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/cacerts
2019-07-30 07:31:39.414 UTC [msp] getPemMaterialFromDir -> DEBU 020 Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/cacerts/ca.org1.example.com-cert.pem
2019-07-30 07:31:39.414 UTC [msp] getPemMaterialFromDir -> DEBU 021 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/admincerts
2019-07-30 07:31:39.414 UTC [msp] getPemMaterialFromDir -> DEBU 022 Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/admincerts/Admin@org1.example.com-cert.pem
2019-07-30 07:31:39.414 UTC [msp] getPemMaterialFromDir -> DEBU 023 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/intermediatecerts
2019-07-30 07:31:39.414 UTC [msp] getMspConfig -> DEBU 024 Intermediate certs folder not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/intermediatecerts]. Skipping. [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/intermediatecerts: no such file or directory]
2019-07-30 07:31:39.414 UTC [msp] getPemMaterialFromDir -> DEBU 025 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/tlscacerts
2019-07-30 07:31:39.414 UTC [msp] getPemMaterialFromDir -> DEBU 026 Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/tlscacerts/tlsca.org1.example.com-cert.pem
2019-07-30 07:31:39.414 UTC [msp] getPemMaterialFromDir -> DEBU 027 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/tlsintermediatecerts
2019-07-30 07:31:39.414 UTC [msp] getMspConfig -> DEBU 028 TLS intermediate certs folder not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/tlsintermediatecerts]. Skipping. [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/tlsintermediatecerts: no such file or directory]
2019-07-30 07:31:39.414 UTC [msp] getPemMaterialFromDir -> DEBU 029 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/crls
2019-07-30 07:31:39.414 UTC [msp] getMspConfig -> DEBU 02a crls folder not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/crls]. Skipping. [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/crls: no such file or directory]
2019-07-30 07:31:39.414 UTC [msp] getMspConfig -> DEBU 02b MSP configuration file not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/config.yaml]: [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/config.yaml: no such file or directory]
2019-07-30 07:31:39.414 UTC [msp] newBccspMsp -> DEBU 02c Creating BCCSP-based MSP instance
2019-07-30 07:31:39.414 UTC [msp] New -> DEBU 02d Creating Cache-MSP instance
2019-07-30 07:31:39.414 UTC [msp] loadLocaMSP -> DEBU 02e Created new local MSP
2019-07-30 07:31:39.414 UTC [msp] Setup -> DEBU 02f Setting up MSP instance Org1MSP
2019-07-30 07:31:39.415 UTC [msp/identity] newIdentity -> DEBU 030 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICRDCCAeqgAwIBAgIRAIGmB76u4bI3ctUs4QfOeFcwCgYIKoZIzj0EAwIwczEL
MAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBG
cmFuY2lzY28xGTAXBgNVBAoTEG9yZzEuZXhhbXBsZS5jb20xHDAaBgNVBAMTE2Nh
Lm9yZzEuZXhhbXBsZS5jb20wHhcNMTkwNzMwMDYzMzEzWhcNMjkwNzI3MDYzMzEz
WjBzMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMN
U2FuIEZyYW5jaXNjbzEZMBcGA1UEChMQb3JnMS5leGFtcGxlLmNvbTEcMBoGA1UE
AxMTY2Eub3JnMS5leGFtcGxlLmNvbTBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IA
BAST5/G8QgME/QJDMQv6BBhfWIzA4Wxcg4Ruppn7+OxeUTUWfJ2kRaUVp1EMC58W
tf7W5PAmqnJrH5PyFazzvpSjXzBdMA4GA1UdDwEB/wQEAwIBpjAPBgNVHSUECDAG
BgRVHSUAMA8GA1UdEwEB/wQFMAMBAf8wKQYDVR0OBCIEINeglHdwXpkuzhJRc1/f
Gt4l4aFjVNul2jbx2Zcu7rYuMAoGCCqGSM49BAMCA0gAMEUCIQDxGU9rA6GTtL2s
WTLcUShQ0pGnoD5HjHDqMsP5EWrhDgIgNAo3LAHJN2gb42msgSYw6xNbyDu/R0go
/Vzw5OskaTY=
-----END CERTIFICATE-----
2019-07-30 07:31:39.415 UTC [msp/identity] newIdentity -> DEBU 031 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICKzCCAdGgAwIBAgIRAL33HdqIRq7GVsrvn8ZzkbUwCgYIKoZIzj0EAwIwczEL
MAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBG
cmFuY2lzY28xGTAXBgNVBAoTEG9yZzEuZXhhbXBsZS5jb20xHDAaBgNVBAMTE2Nh
Lm9yZzEuZXhhbXBsZS5jb20wHhcNMTkwNzMwMDYzMzEzWhcNMjkwNzI3MDYzMzEz
WjBsMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMN
U2FuIEZyYW5jaXNjbzEPMA0GA1UECxMGY2xpZW50MR8wHQYDVQQDDBZBZG1pbkBv
cmcxLmV4YW1wbGUuY29tMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE/qgU40TV
sxbFg21jVRvlx114TvdAK6BhfDG2ECbRJ48KAeSK95E6dp8Qte49U+uXFJ0pvtKF
9xvZje8BU+8xaaNNMEswDgYDVR0PAQH/BAQDAgeAMAwGA1UdEwEB/wQCMAAwKwYD
VR0jBCQwIoAg16CUd3BemS7OElFzX98a3iXhoWNU26XaNvHZly7uti4wCgYIKoZI
zj0EAwIDSAAwRQIhAJL0PbcdD5imGeEUGgBbxJrCdfPp8ceWG/skkuc+yDmLAiAI
KyjJVssdfN1mvLCeVhBFU5XrYs2kR4QpXkn4YmtrwQ==
-----END CERTIFICATE-----
2019-07-30 07:31:39.431 UTC [msp/identity] newIdentity -> DEBU 032 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICKzCCAdGgAwIBAgIRAL33HdqIRq7GVsrvn8ZzkbUwCgYIKoZIzj0EAwIwczEL
MAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBG
cmFuY2lzY28xGTAXBgNVBAoTEG9yZzEuZXhhbXBsZS5jb20xHDAaBgNVBAMTE2Nh
Lm9yZzEuZXhhbXBsZS5jb20wHhcNMTkwNzMwMDYzMzEzWhcNMjkwNzI3MDYzMzEz
WjBsMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMN
U2FuIEZyYW5jaXNjbzEPMA0GA1UECxMGY2xpZW50MR8wHQYDVQQDDBZBZG1pbkBv
cmcxLmV4YW1wbGUuY29tMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE/qgU40TV
sxbFg21jVRvlx114TvdAK6BhfDG2ECbRJ48KAeSK95E6dp8Qte49U+uXFJ0pvtKF
9xvZje8BU+8xaaNNMEswDgYDVR0PAQH/BAQDAgeAMAwGA1UdEwEB/wQCMAAwKwYD
VR0jBCQwIoAg16CUd3BemS7OElFzX98a3iXhoWNU26XaNvHZly7uti4wCgYIKoZI
zj0EAwIDSAAwRQIhAJL0PbcdD5imGeEUGgBbxJrCdfPp8ceWG/skkuc+yDmLAiAI
KyjJVssdfN1mvLCeVhBFU5XrYs2kR4QpXkn4YmtrwQ==
-----END CERTIFICATE-----
2019-07-30 07:31:39.431 UTC [bccsp_sw] loadPrivateKey -> DEBU 033 Loading private key [f31e0521aa582cb638ae53f074379212d1cab384b977da607580ff2707cba9cf] at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/f31e0521aa582cb638ae53f074379212d1cab384b977da607580ff2707cba9cf_sk]...
2019-07-30 07:31:39.432 UTC [msp/identity] newIdentity -> DEBU 034 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICKzCCAdGgAwIBAgIRAL33HdqIRq7GVsrvn8ZzkbUwCgYIKoZIzj0EAwIwczEL
MAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBG
cmFuY2lzY28xGTAXBgNVBAoTEG9yZzEuZXhhbXBsZS5jb20xHDAaBgNVBAMTE2Nh
Lm9yZzEuZXhhbXBsZS5jb20wHhcNMTkwNzMwMDYzMzEzWhcNMjkwNzI3MDYzMzEz
WjBsMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMN
U2FuIEZyYW5jaXNjbzEPMA0GA1UECxMGY2xpZW50MR8wHQYDVQQDDBZBZG1pbkBv
cmcxLmV4YW1wbGUuY29tMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE/qgU40TV
sxbFg21jVRvlx114TvdAK6BhfDG2ECbRJ48KAeSK95E6dp8Qte49U+uXFJ0pvtKF
9xvZje8BU+8xaaNNMEswDgYDVR0PAQH/BAQDAgeAMAwGA1UdEwEB/wQCMAAwKwYD
VR0jBCQwIoAg16CUd3BemS7OElFzX98a3iXhoWNU26XaNvHZly7uti4wCgYIKoZI
zj0EAwIDSAAwRQIhAJL0PbcdD5imGeEUGgBbxJrCdfPp8ceWG/skkuc+yDmLAiAI
KyjJVssdfN1mvLCeVhBFU5XrYs2kR4QpXkn4YmtrwQ==
-----END CERTIFICATE-----
2019-07-30 07:31:39.432 UTC [msp] setupSigningIdentity -> DEBU 035 Signing identity expires at 2029-07-27 06:33:13 +0000 UTC
2019-07-30 07:31:39.432 UTC [msp] Validate -> DEBU 036 MSP Org1MSP validating identity
2019-07-30 07:31:39.432 UTC [msp] GetDefaultSigningIdentity -> DEBU 037 Obtaining default signing identity
2019-07-30 07:31:39.434 UTC [grpc] Printf -> DEBU 038 parsed scheme: ""
2019-07-30 07:31:39.434 UTC [grpc] Printf -> DEBU 039 scheme "" not registered, fallback to default scheme
2019-07-30 07:31:39.434 UTC [grpc] Printf -> DEBU 03a ccResolverWrapper: sending new addresses to cc: [{peer0.org1.example.com:7051 0  <nil>}]
2019-07-30 07:31:39.434 UTC [grpc] Printf -> DEBU 03b ClientConn switching balancer to "pick_first"
2019-07-30 07:31:39.434 UTC [grpc] Printf -> DEBU 03c pickfirstBalancer: HandleSubConnStateChange: 0xc42015fa90, CONNECTING
2019-07-30 07:31:39.440 UTC [grpc] Printf -> DEBU 03d pickfirstBalancer: HandleSubConnStateChange: 0xc42015fa90, READY
2019-07-30 07:31:39.440 UTC [channelCmd] InitCmdFactory -> INFO 03e Endorser and orderer connections initialized
2019-07-30 07:31:39.440 UTC [msp/identity] Sign -> DEBU 03f Sign: plaintext: 0AB8070A5C08011A0C08DBE4FFE90510...8EAEF5D78CF31A080A000A000A000A00 
2019-07-30 07:31:39.440 UTC [msp/identity] Sign -> DEBU 040 Sign: digest: 71B45AFE428ECB6D928F91F0AEBB074088058B1C3369AEC2D57134AEA7111B32 
2019-07-30 07:31:39.508 UTC [channelCmd] executeJoin -> INFO 041 Successfully submitted proposal to join channel

```
