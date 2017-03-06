#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo Latest tag is `git describe --tags`
    exit 0
fi

tag=$1

date > trigger_file
git add trigger_file
git commit -m "Pre-tag commit for $tag"
git tag $tag
date > trigger_file
git add trigger_file
git commit -m "Post-tag commit for $tag to trigger rebuild"
git push

