#!/bin/bash

IDLE=600000
STOPCMD="transmission-remote -S"
STARTCMD="transmission-remote -s"

STOPPED="yes"
while true; do
    if [ `xprintidle` -gt $IDLE ]; then
        if [ $STOPPED = "yes" ]; then
            $STARTCMD
            STOPPED="no"
        fi
    else
        if [ $STOPPED = "no" ]; then
            $STOPCMD
            STOPPED="yes"
        fi
    fi
    sleep 60
done
