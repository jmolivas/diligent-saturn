#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5eba0ba80a9c5b001bfb390f/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5eba0ba80a9c5b001bfb390f
curl -s -X POST https://api.stackbit.com/project/5eba0ba80a9c5b001bfb390f/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5eba0ba80a9c5b001bfb390f/webhook/build/publish > /dev/null
