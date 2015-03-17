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
    Running on port 25556
    ```

1. start a Bitkeeper instance (in a separate console):
    ```
    ./keeper.sh
    ```
    Output:
    ```
    Bitkeeper is ready, starting server...
    Running on port: 25667
    ```

## Sample queries (see [docs](http://docs.tradle1.apiary.io))

###Charge Bitjoe (10000 satoshis in this case, may take 5-10 seconds)

_Only available when running on testnet_

    curl -X POST -d "amount=10000" http://localhost:25556/charge

```json
{
  "charged": 10000
}
```

###Create an object
    curl -X PUT -d '{"name":"Squinty"}' http://localhost:25556/transaction?public=1

```json
{
  "fileKey": "8da939ce8be6d6b563b382f5c9d2eb20f454e0ce",
  "permissions": {},
  "public": {
    "02f8248e9001ac57ce812a423a7db11983303c48e57202d01657eda1f6f73e28bc": {
      "txId": "88eff3a14de1334687fb07ab7d95d4433bcdcf48c02660aca1117e9e0025cefb",
      "txUrl": "http://tbtc.blockr.io/tx/info/88eff3a14de1334687fb07ab7d95d4433bcdcf48c02660aca1117e9e0025cefb"
    }
  },
  "fileUrl": "http://127.0.0.1:25667/get?key=8da939ce8be6d6b563b382f5c9d2eb20f454e0ce"
}
```

### Create a public object with a given JSON file's contents

    curl -X PUT -d @vocab/resources/business/common/basicReceipt.json http://127.0.0.1:25556/transaction?public=1

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

### "Modify" an object 

_uses chaining, as everything on blockchain is immutable_

    curl -X PUT -d '{"name":"Squinty", "age":154, "_prev":"8da939ce8be6d6b563b382f5c9d2eb20f454e0ce"}' http://localhost:25556/transaction?public=1

```json
{
  "fileKey": "bc6762648f32e0c2989326d37e92bb17bc78f822",
  "permissions": {},
  "public": {
    "02f8248e9001ac57ce812a423a7db11983303c48e57202d01657eda1f6f73e28bc": {
      "txId": "c6e1e86611edc1a62c87171cbd160eee55764d716a5cd7eed3b972ff75bae58f",
      "txUrl": "http://tbtc.blockr.io/tx/info/c6e1e86611edc1a62c87171cbd160eee55764d716a5cd7eed3b972ff75bae58f"
    }
  },
  "fileUrl": "http://127.0.0.1:25667/get?key=bc6762648f32e0c2989326d37e92bb17bc78f822"
}
```

###Create and object, encrypt and store it and share access to it
    curl -X PUT -d '{"message":"I love you, Phillip Morris!"}' http://localhost:25556/transaction?to=024289801366bcee6172b771cf5a7f13aaecd237a0b9a1ff9d769cabc2e6b70a34

```json
{
  "fileKey": "19c841b4358a52bd04d10f2c7091f48f3db96be8",
  "permissions": {
    "024289801366bcee6172b771cf5a7f13aaecd237a0b9a1ff9d769cabc2e6b70a34": {
      "txId": "82e1d4f71e3fd64a947fb72c2e80e126a4b6793728123d32510b29e112038634",
      "txUrl": "http://tbtc.blockr.io/tx/info/82e1d4f71e3fd64a947fb72c2e80e126a4b6793728123d32510b29e112038634",
      "key": "9e9b4e051efbd118d6280c88370c73b2e094555f",
      "fileUrl": "http://127.0.0.1:25667/get?key=9e9b4e051efbd118d6280c88370c73b2e094555f"
    }
  },
  "public": {},
  "fileUrl": "http://127.0.0.1:25667/get?key=19c841b4358a52bd04d10f2c7091f48f3db96be8"
}
```

## Real(er) world examples: 

### Create a model for Person
    curl -X PUT -d '{"type":"Person","properties":{"firstName":{}}}' http://localhost:25556/transaction?public=1

```json
{
  "fileKey": "2ceac9874a42ec5823fd92cc5d3ee918c7ffc85a",
  "...": "..."
}
```

### Create a model for Friend
    curl -X PUT -d '{"type":"Friend","properties":{"friend1":{},"friend2":{}}}' http://localhost:25556/transaction?public=1

```json
{
  "fileKey": "b843cfe2d6ddc70575afa9f4968f317851332e88",
  "...": "..."
}
```

### Create Athos, a resource of type Person
    curl -X PUT -d '{"_type":"Person","_type_hash":"2ceac9874a42ec5823fd92cc5d3ee918c7ffc85a","firstName":"Athos"}' http://localhost:25556/transaction?public=1

```json
{
  "fileKey": "6b83099a715b71279e18b82948a9dff5f8f3c5e7",
  "...": "..."
}
```

### Create Porthos, a resource of type Person
    curl -X PUT -d '{"_type":"Person","_type_hash":"2ceac9874a42ec5823fd92cc5d3ee918c7ffc85a","firstName":"Porthos"}' http://localhost:25556/transaction?public=1

```json
{
  "fileKey": "3fe81f073a1b5be665b15908837d4b0e0f84d0bc",
  "...": "..."
}
```

### Make Athos and Porthos friends
    curl -X PUT -d '{"_type":"Friend","_type_hash":"b843cfe2d6ddc70575afa9f4968f317851332e88","friend1":"6b83099a715b71279e18b82948a9dff5f8f3c5e7","friend2":"3fe81f073a1b5be665b15908837d4b0e0f84d0bc"}' http://localhost:25556/transaction?public=1

```json
{
  "fileKey": "d9236fd6af5b1c5e820d85921ee9768966ffc263",
  "...": "..."
}
```

### Change Athos' name to Lavos
    curl -X PUT -d '{"_type":"Person","_type_hash":"2ceac9874a42ec5823fd92cc5d3ee918c7ffc85a","_prev":"6b83099a715b71279e18b82948a9dff5f8f3c5e7","firstName":"Lavos"}' http://localhost:25556/transaction?public=1

```json
{
  "fileKey": "59673294f069df75ccc99674dfd5890538828183",
  "...": "..."
}
```

### Debate whether Athos and Porthos are still friends

_Left as an exercise to the developer_

## Troubleshooting

By default, this setup runs on Bitcoin Testnet 3. The built-in wallet will charge at birth, but while putting the Three Musketeers on chain, you may see:

```json
{
  "code": 400,
  "message": "Not enough funds to create storage transaction, send coins to [insert wallet testnet address]"
}
```

At this point, you can charge the wallet with:

    curl -X POST -d "amount=10000" http://localhost:25556/charge

## Alternative way to setup, using a docker
To run a docker container

    docker run --rm -p 25556:25556 -p 8383:8080 -t -i pgmglv/tradle-cpp-ethereum /sbin/my_init -- bash -l

On Mac, if you are using boot2docker, run boot2docker ip, as [described in this tutorial](http://webiphany.com/technology/2014/06/12/what-ip-do-i-access-when-using-docker-and-boot2docker.html). On my machine it returns 192.168.59.103

Test Ethereum JSON-RPC using this IP and port 8383

    curl -X POST --data '{"jsonrpc":"2.0","method":"web3_sha3","params":["0x68656c6c6f20776f726c64"],"id":64}' http://192.168.59.103:8383

You should get something like this:

    {"id":64,"jsonrpc":"2.0","result":"0x47173285a8d7341e5e972fc677286384f802f8ef42a5ec5f03bbfa254cb01fad"}

Now you can talk to bitjoe (using this IP and port 25556), for example:

    curl -X POST -d "amount=10000" http://192.168.59.103:25556/charge

