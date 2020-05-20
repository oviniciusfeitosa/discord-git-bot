#!/usr/bin/env bash

source config.sh

curl -H "Content-Type: application/json" \
-X POST \
-d "{\"username\": \"${username}\", \"content\": \"${message}\"}" $url