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
    Existing wallet not found at specified path, creating a new wallet
    ...
    Running on port 8081
    ```

1. start a Bitkeeper instance (in a separate console):
    ```
    ./keeper.sh
    Bitkeeper is ready, starting server...
    Running on port: 8000
    ```

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
