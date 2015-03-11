##Setup
_This setup is for Linux and Mac OSX. We are working on a docker-based installation, which will simplify this setup._

1. Install [node.js](http://nodejs.org/)

1. Install [git](http://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

1. Clone this repo and run the setup script: 
    ```
    git clone https://github.com/tradle/bootstrap-example.git
    cd bootstrap-example
    ./setup.sh
    ```
    
1. start a Bitjoe instance:
    ```
    ./joe.sh
    ```
    Output:
    ```
    Existing wallet not found at specified path, creating a new wallet
    ...
    Running on port 8081
    ```

1. start a Bitkeeper instance (in a separate console):
    ```
    ./keeper.sh
    ```
    Output:
    ```
    Bitkeeper is ready, starting server...
    Running on port: 8000
    ```

##Sample queries (see [docs](http://docs.tradle1.apiary.io)): 

Charge Bitjoe (10000 satoshis in this case, may take 5-10 seconds):
```
curl -X POST -d amount=10000 http://127.0.0.1:8081/charge
```
Output:
```json
{
  "charged": 10000
}
```
Create a public object with a given JSON file's contents
```
curl -X PUT -d @vocab/resources/business/common/basicReceipt.json http://127.0.0.1:8081/transaction?public=1
```
Output:
```json
{
  "fileKey": "c80d1b27e572a49a22930aa3d942c31291383acc",
  "permissions": {},
  "public": {
    "020dd2eede7f9e3c01768e6df9586568405ba5518d6e62d8f56cfebfea099a2385": {
      "txId": "0cf7020c197a7d6a08007a15464648f60b6e62540ffce879a70c7071f9e01a14",
      "txUrl": "http://tbtc.blockr.io/tx/info/0cf7020c197a7d6a08007a15464648f60b6e62540ffce879a70c7071f9e01a14"
    }
  },
  "fileUrl": "http://127.0.0.1:8000/get?key=c80d1b27e572a49a22930aa3d942c31291383acc"
}
```

Create an object with a given JSON file's contents, store it in encrypted form and share access to it with one or more parties (read "bitcoin public keys" for now)
```
curl -X PUT -d @vocab/resources/business/common/basicReceipt.json http://127.0.0.1:8081/transaction?to=024289801366bcee6172b771cf5a7f13aaecd237a0b9a1ff9d769cabc2e6b70a34
```
```json
{
  "fileKey": "23d4930d1b66d7464a1a0d0fffe2ec9f2a2c4e63",
  "permissions": {
    "024289801366bcee6172b771cf5a7f13aaecd237a0b9a1ff9d769cabc2e6b70a34": {
      "txId": "e7299faadbd38b43288bc41417cf16374de7b07a659c40cf0ca0253220bb7d93",
      "txUrl": "http://tbtc.blockr.io/tx/info/e7299faadbd38b43288bc41417cf16374de7b07a659c40cf0ca0253220bb7d93",
      "key": "3733fc8e62ceb74713ba2694c28ce1b6d985dc79",
      "fileUrl": "http://127.0.0.1:8000/get?key=3733fc8e62ceb74713ba2694c28ce1b6d985dc79"
    }
  },
  "public": {},
  "fileUrl": "http://127.0.0.1:8000/get?key=23d4930d1b66d7464a1a0d0fffe2ec9f2a2c4e63"
}
```
