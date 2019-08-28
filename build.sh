#!/bin/bash

docker pull codeskyblue/gohttpserver

mkdir release && cd release
docker save --output gohttpserver.tar codeskyblue/gohttpserver
git init
git config user.name "xuchengpeng"
git config user.email "330476629@qq.com"
git lfs track "*.tar"
git add .
git commit -m "Release `date +"%Y-%m-%d %H:%M:%S"`"
git push --force --quiet "https://${TRAVIS_TOKEN}@${GH_REF}" master:docker
