#!/bin/bash

wlogout --protocol layer-shell -b 6 -T 350 -B 350 &

id=$!

timeout 30s tail --pid $id -f /dev/null

if ps -p $id > /dev/null; then
  kill -KILL $id
fi
