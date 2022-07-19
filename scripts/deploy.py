
from brownie import accounts, SimpleStorage, network

LOCAL_BLOCKCHAIN_ENVIRONMENT = ["ganache-local"]

def deploy_simple_storage():
    
    if(network.show_active() in LOCAL_BLOCKCHAIN_ENVIRONMENT):
        account=accounts[0]
    

    else:
        account = accounts.load("Account_Rinkeby")
    
    
    print(account)
    simple_storage = SimpleStorage.deploy({"from":account})
    print(simple_storage)
    stored_value=simple_storage.retrieve()
    print(stored_value)
    transaction = simple_storage.store(250, {"from":account})
    transaction.wait(1)
    updated_stored_value = simple_storage.retrieve()
    print(updated_stored_value)



def main():
    deploy_simple_storage()
    

