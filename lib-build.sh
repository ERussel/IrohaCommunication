#!/bin/bash

set -ex
if [ "$(uname)" != "Darwin" ]; then
    echo "Only MacOS is supported"
    exit 1
fi

command -v protoc >/dev/null 2>&1 || { echo "protoc is required to continue..." >&2; exit 1; }

IROHA_PATH="iroha"
SCHEMA_PATH="Schema"
PROTOLIB_PATH="protobuf"
PROTO_GEN="ProtoGen"

[ -d $IROHA_PATH ] && rm -rf $IROHA_PATH

git clone -b dev --depth=1 https://github.com/hyperledger/iroha

[ -d $SCHEMA_PATH ] && rm -rf $SCHEMA_PATH
mkdir $SCHEMA_PATH

cp -R "$IROHA_PATH/shared_model/schema" "$SCHEMA_PATH/proto"

[ -d $PROTO_GEN ] && rm -rf $PROTO_GEN
mkdir $PROTO_GEN

protoc --plugin=grpc_objective_c_plugin --objc_out=${PROTO_GEN} --proto_path=./${SCHEMA_PATH}/proto ./${SCHEMA_PATH}/proto/*.proto

[ -d $IROHA_PATH ] && rm -rf $IROHA_PATH
[ -d $SCHEMA_PATH ] && rm -rf $SCHEMA_PATH