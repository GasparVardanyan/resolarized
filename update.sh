#!/usr/bin/env bash

find . -maxdepth 5 -type d -name '*.git' | while read d
do
	echo "UPDATING $d"
	pushd "$d" >/dev/null
	grep -Fq fetch config || git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
	git remote get-url origin >/dev/null 2>&1 && git fetch
	popd >/dev/null
done
