#!/bin/bash
# Script to test network lag
# Written by Mike Studer

# Usage
# Use this script to try pinging DNS resolvers and get
# the RTT (round trip time) for each
# Defaul is to do one ping however you can add a cmd line
# number to tell it how many pings to do for each
#

if [ $# -eq 1 ]
then
    c=$1
else
    c="1"
fi

opendns=`ping -c"$c" 208.67.220.220|grep rtt |cut -d '/' -f5`
cloudflare=`ping -c"$c" 1.1.1.1|grep rtt |cut -d '/' -f5`
google=`ping -c"$c" 8.8.8.8|grep rtt |cut -d '/' -f5`

echo "OpenDNS = $opendns ms average rtt"
echo "Cloudflare DNS = $cloudflare ms average rtt"
echo "Google DNS = $google ms average rtt"

