##Setup
This setup is for for linux and Mac OSX. We are working on a docker-based installation, which will simplify this setup.

Install [node.js](http://nodejs.org/)
Install [git](http://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
Git clone this repo

Run ./setup.sh to pull in the required components

In a separate console run ./joe.sh to start a Bitjoe instance (wait till you see in the console: "running on port 8081")
    
In a separate console run ./keeper.sh to start a Bitkeeper instance (wait till it stops writing to the console) 

##Sample queries: 

Charge Bitjoe (10000 satoshis in this case):
```
curl -X POST -d amount=10000 http://127.0.0.1:8081/charge
```
Create a public object with a given JSON file's contents
```
curl -X PUT -d @vocab/resources/business/common/basicReceipt.json http://127.0.0.1:8081/transaction?public=1
```
Create an object with a given JSON file's contents, store it in encrypted form and share access to it with one or more parties (read "bitcoin public keys" for now)
```
curl -X PUT -d @vocab/resources/business/common/basicReceipt.json http://127.0.0.1:8081/transaction?to=024289801366bcee6172b771cf5a7f13aaecd237a0b9a1ff9d769cabc2e6b70a34
```
