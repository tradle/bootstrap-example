#!/bin/bash
cd /bitkeeper-server-js 
exec DEBUG=* node app --dht=false
