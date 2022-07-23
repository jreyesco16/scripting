# Write a program that prints the numbers from 1 to 100 and for multiples of ‘3’ print “Fizz” instead of the number and for the multiples of ‘5’ print “Buzz”.



def fizz_and_buzz():
    for i in range(100):
        n = i+1

        str: string = ""
        
        if (n % 3 == 0):
            str += "Fizz"
        if (n % 5 == 0):
            str += "Buzz"
        if (str == ""):
            str += n.__str__()

        print(str)



def main():
    fizz_and_buzz()


if __name__=="__main__":
    main()