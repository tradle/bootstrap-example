##Setup

Install [node.js](http://nodejs.org/)

Run ./setup.sh to pull in the required components

Run ./joe.sh to start a Bitjoe instance
    
Run ./keeper.sh to start a Bitkeeper instance

##Sample queries: 

- Charge Bitjoe (10000 satoshis in this case):
```
curl -X POST -d amount=10000 http://127.0.0.1:8081/charge
```
- Create a public object with a given JSON file's contents
```
curl -X PUT -d @vocab/resources/business/common/basicReceipt.json http://127.0.0.1:8081/transaction?public=1
```
- Create an object with a given JSON file's contents, store it in encrypted form and share access to it with one or more parties (read "bitcoin public keys" for now)
```
curl -X PUT -d @vocab/resources/business/common/basicReceipt.json http://127.0.0.1:8081/transaction?to=024289801366bcee6172b771cf5a7f13aaecd237a0b9a1ff9d769cabc2e6b70a34
```
