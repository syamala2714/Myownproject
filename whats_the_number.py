'''
The program generates a random number using the random function. The user tries to guess it by inputting a value.
'''

import random

class guess_the_number():
    def __init__(self,guessing_number=None):
        self.guessing_number = guessing_number

    def val_guess_the_num(self):
        random_number = random.randint(0,1000)
        print("random_number ", random_number)
        count = 1
        chances = 3
        if self.guessing_number is not None:
            if random_number==int(self.guessing_number):
                print ("User has guess the correct number")
                return True
            else:
                print("User has failed to guess the correct number")
                return False
        else:
            while count<=chances:
                input_guess_number=input("Enter the number to guess the number ")
                if random_number==int(input_guess_number):
                    print ("User has guess the correct number")
                    return True
                else:
                    print("User has failed to guess the correct number")
                    count+=1

obj1 = guess_the_number()
print(obj1.val_guess_the_num())
