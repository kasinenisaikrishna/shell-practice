#!/bin/bash

set -e 

failure(){
    echo "failed at: $1:$2"
}

trap 'failure "${LINENO}" "$BASH_COMMAND"' ERR
echo "Hello world success"
echooo "Hello world failure"
echo "Hello world after failure"