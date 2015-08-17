#!/bin/env bash

CHECKING_SCRIPT="xrandr | grep \"VGA1 connected\" > /dev/null"
DUAL_HEAD_SCRIPT="$HOME/skrypty/dual_head.sh"
SINGLE_HEAD_SCRIPT="$HOME/skrypty/single_head.sh"

eval $CHECKING_SCRIPT
STATUS=$?
if (( "$STATUS" == 0 )); then
    $DUAL_HEAD_SCRIPT
else
    $SINGLE_HEAD_SCRIPT
fi

while true; do
    eval $CHECKING_SCRIPT
    N_STATUS=$?
    if (( "$STATUS" == "1" )) && (( "$N_STATUS" == "0" )); then
        $DUAL_HEAD_SCRIPT
        STATUS=$N_STATUS
    elif (( "$STATUS" == "0" )) && (( "$N_STATUS" == "1" )); then
        $SINGLE_HEAD_SCRIPT
        STATUS=$N_STATUS
    fi
    sleep 2
done
