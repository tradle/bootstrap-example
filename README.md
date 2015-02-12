    Run ./setup.sh to pull in the required components

    Run ./joe.sh to start a Bitjoe instance
    
    Run ./keeper.sh to start a Bitkeeper instance

##Sample queries: 

    curl -X PUT -d @vocab/resources/business/common/basicReceipt.json http://localhost:8081/transaction?public=1

    curl -X PUT -d @vocab/resources/business/common/basicReceipt.json http://localhost:8081/transaction?to=024289801366bcee6172b771cf5a7f13aaecd237a0b9a1ff9d769cabc2e6b70a34
