#!/bin/bash

new_tab() {
  pwd=`pwd`
  osascript -e "tell application \"Terminal\"" \
  -e "tell application \"System Events\" to keystroke \"t\" using {command down}" \
  -e "do script \"cd $pwd; clear; $1;\" in front window" \
  -e "end tell"
  > /dev/null
}

git clone https://github.com/tradle/bitjoe-server-js
git clone https://github.com/tradle/bitkeeper-server-js
git clone https://github.com/mvayngrib/models vocab
cd bitjoe-server-js
npm install
cd ../bitkeeper-server-js
npm install
new_tab "cd ../bitjoe-server-js && node app"
new_tab "echo example: curl -X PUT -d @../vocab/resources/business/common/basicReceipt.json http://localhost:8081/transaction?public=1"
node app --dht=false