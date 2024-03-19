#!/bin/sh
text=$(virsh list --all |
	grep $1 |
	sed "s/.*${1} *//g" |
	sed "s/ //g")

echo {\"text\":\"\"\,\"class\":\"$text\"}
