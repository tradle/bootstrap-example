    Run ./setup.sh to pull in the required components

    Run ./joe.sh to start a Bitjoe instance
    
    Run ./keeper.sh to start a Bitkeeper instance

##Sample queries: 

-Charge Bitjoe:
    curl -X POST -d amount=9999 http://localhost:8081/charge

-Create a public object
    curl -X PUT -d @vocab/resources/business/common/basicReceipt.json http://localhost:8081/transaction?public=1

-Create and object, encrypt and store it and share access to it
    curl -X PUT -d @vocab/resources/business/common/basicReceipt.json http://localhost:8081/transaction?to=024289801366bcee6172b771cf5a7f13aaecd237a0b9a1ff9d769cabc2e6b70a34
