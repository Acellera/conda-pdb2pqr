#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <new tag name>"
    echo Latest tag is `git describe --tags`
    echo "Please stick to tags like 2.1.1+htmd.XXX unless there is a new upstream"
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
git push --tags

