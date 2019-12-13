#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5df3b8d9d03a0a00144bf48c/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5df3b8d9d03a0a00144bf48c
curl -s -X POST https://api.stackbit.com/project/5df3b8d9d03a0a00144bf48c/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5df3b8d9d03a0a00144bf48c/webhook/build/publish > /dev/null
