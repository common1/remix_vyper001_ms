# pragma version 0.4.0
# @licence MIT

my_favorite_number: public(uint256) # 0

# Constructor
@deploy
def __init__():
    self.my_favorite_number = 7

@external
def store(new_number: uint256):
    self.my_favorite_number = new_number

@external
@view
def retrieve() -> uint256:
    return self.my_favorite_number