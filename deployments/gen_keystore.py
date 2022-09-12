import json
import os
import sys
from datetime import datetime

from eth_keys import keys
from web3 import Web3

KEYSTORE_DIR = 'keystores'

def gen_keystore(pk, pw):
    keystore_dir = os.path.join(os.getcwd(), 'keystore')
    os.makedirs(keystore_dir, exist_ok=True)
    
    private_key = keys.PrivateKey(bytearray.fromhex(pk)) 
    account = keys.private_key_to_public_key(private_key).to_address()
    keystore_filename = '%s--%s' % (datetime.utcnow().strftime('UTC--%Y-%m-%dT%H-%M-%S.%fZ'), account[2:])
    keystore = Web3().eth.account.encrypt(private_key, pw)
    with open(os.path.join(keystore_dir, keystore_filename), 'w') as file:
        json.dump(keystore, file)
    print("account:", account)
    print("private_key:", pk)

if __name__ == '__main__':
    pk = sys.argv[1]
    pw = sys.argv[2] if len(sys.argv) == 3 else ""
    gen_keystore(pk, pw)
