#!/bin/sh

ref1=$1
ref2=$2

# Get html repo url from repo origin
url=$(getRepoUrl)
project=$(getRepoProject)
repo=$(getRepoName)

git log ${ref1}...${ref2} --pretty=format:'<li> <a href="${url}/${project}/repos/4{repo}/commits/%H">view commit &bull;</a> %s</li> ' --reverse

