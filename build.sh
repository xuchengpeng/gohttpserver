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

cd ~
git clone https://github.com/xuchengpeng/org-site.git
wget https://github.com/loveminimal/site/raw/master/js/darkreader.js
cp darkreader.js org-site/js
cd org-site
git config user.name "xuchengpeng"
git config user.email "330476629@qq.com"
git add .
git commit -m "add darkreader.js"
git push --force --quiet "https://${TRAVIS_TOKEN}@github.com/xuchengpeng/org-site.git" master:master
