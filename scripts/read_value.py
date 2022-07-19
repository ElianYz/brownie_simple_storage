from asyncore import read
from brownie import SimpleStorage, accounts 

def read_contract(): 

    simple_storage = SimpleStorage[-1]
    #ABI 
    #Address 
    print(simple_storage)
    print(simple_storage.retrieve())

    
    


def main(): 

    read_contract()