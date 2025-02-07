# pragma version 0.4.0
# @licence MIT

struct Person:
    favorite_number: uint256
    name: String[100]

my_name: public(String[100])
my_favorite_number: public(uint256) # 0

list_of_numbers: public(uint256[5])
list_of_people: public(Person[5])
index: public(uint256)

# Constructor
@deploy
def __init__():
    self.my_favorite_number = 7
    self.index = 0
    self.my_name = "Patrick"

@external
def store(new_number: uint256):
    self.my_favorite_number = new_number

@external
@view
def retrieve() -> uint256:
    return self.my_favorite_number

@external
def add_person(
    name: String[100],
    favorite_number: uint256
):
    # Add favorite number to the numbers list
    self.list_of_numbers[self.index] = favorite_number

    # Add the person to the person's list
    new_person: Person = Person(
        favorite_number = favorite_number,
        name = name
    )
    self.list_of_people[self.index] = new_person

    self.index = self.index + 1
