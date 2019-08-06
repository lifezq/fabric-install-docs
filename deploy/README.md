## Fabric 安装部署
### 1. 环境配置
#### 1.1 安装GO语言环境 go version 1.8+
#### 1.2 安装依赖包
```
$ yum install -y libtool glibc-static zlib-devel glibc-devel zlib-devel
```
#### 1.3 安装docker 1.12+

### 2. 获取代码
```
$ mkdir -p $GOPATH/src/github.com/hyperledger
$ cd $GOPATH/src/github.com/hyperledger
$ git clone --single-branch -b v1.2.1 --depth 1 https://github.com/hyperledger/fabric.git
```
#### 2.1 编译安装fabric-peer组件
```
$ ARCH=x86_64
$ BASEIMAGE_RELEASE=0.4.10
$ PROJECT_VERSION=1.2.1
$ LD_FLAGES="-X github.com/hyperledger/fabric/common/metadata.Version=${PROJECT_VERSION} \
  -X github.com/hyperledger/fabric/common/metadata.BaseVersion=${BASEIMAGE_RELEASE} \
  -X github.com/hyperledger/fabric/common/metadata.BaseDockerLabel=org.hyperledger.fabric \
  -X github.com/hyperledger/fabric/common/metadata.DockerNamespace=hyperledger \
  -X github.com/hyperledger/fabric/common/metadata.BaseDockerNamespace=hyperledger"
$ CGO_CFLAGS=" " go install -ldflags "$LD_FLAGS -linkmode external -extldflags '-static -lpthread'" \
  github.com/hyperledger/fabric/peer
```

#### 2.2 编译安装fabric-orderer组件
```
$ ARCH=x86_64
$ BASEIMAGE_RELEASE=0.4.10
$ PROJECT_VERSION=1.2.1
$ LD_FLAGES="-X github.com/hyperledger/fabric/common/metadata.Version=${PROJECT_VERSION} \
  -X github.com/hyperledger/fabric/common/metadata.BaseVersion=${BASEIMAGE_RELEASE} \
  -X github.com/hyperledger/fabric/common/metadata.BaseDockerLabel=org.hyperledger.fabric \
  -X github.com/hyperledger/fabric/common/metadata.DockerNamespace=hyperledger \
  -X github.com/hyperledger/fabric/common/metadata.BaseDockerNamespace=hyperledger"
$ CGO_CFLAGS=" " go install -ldflags "$LD_FLAGS -linkmode external -extldflags '-static -lpthread'" \
  github.com/hyperledger/fabric/orderer
```

#### 2.3 编译安装fabric-ca组件
```
$ cd $GOPATH/src/github.com/hyperledger
$ git clone --single-branch -b v1.2.1 --depth 1 https://github.com/hyperledger/fabric-ca.git
$ go install -ldflags " -linkmode external -extldflags '-static -lpthread'" github.com/hyperledger/fabric-ca/cmd/...
```
