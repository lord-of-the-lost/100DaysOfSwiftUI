import Foundation

// MARK: - Checkpoint 1

//Creates a constant holding any temperature in Celsius.
//Converts it to Fahrenheit by multiplying by 9, dividing by 5, then adding 32.
//Prints the result for the user, showing both the Celsius and Fahrenheit values.

let temperatureInCelsius = 22
let temperatureInFahrenheit = ((temperatureInCelsius * 9) / 5) + 32

print("Temperature in Celsius: \(temperatureInCelsius)°C")
print("Temperature in Fahrenheit: \(temperatureInFahrenheit)°F")

// MARK: - Checkpoint 2

//This time the challenge is to create an array of strings, then write some code that prints the number of items in the array and also the number of unique items in the array.

let someArray = ["a", "a", "a", "a", "c", "b", "a", "d"]
let someSet = Set(someArray)
print(someArray.count)
print(someSet.count)

// MARK: - Checkpoint 3

//The problem is called fizz buzz, and has been used in job interviews, university entrance tests, and more for as long as I can remember. Your goal is to loop from 1 through 100, and for each number:
//
//If it’s a multiple of 3, print “Fizz”
//If it’s a multiple of 5, print “Buzz”
//If it’s a multiple of 3 and 5, print “FizzBuzz”
//Otherwise, just print the number.
//So, here are some example values you should have when your code runs:
//
//1 should print “1”
//2 should print “2”
//3 should print “Fizz”
//4 should print “4”
//5 should print “Buzz”
//6 should print “Fizz”
//7 should print “7”
//…
//15 should print “FizzBuzz”
//…
//100 should print “Buzz”

func fizzBuzz() {
    for number in 1...100 {
        if (number % 3 == 0) && (number % 5 == 0) {
            print("FizzBuzz")
        } else if number % 5 == 0 {
            print("Buzz")
        } else if number % 3 == 0 {
            print("Fizz")
        } else {
            print(number)
        }
    }
}

func fizzBuzzAnother() {
    for number in 1...100 {
        switch number {
        case let num where (num % 3 == 0 && num % 5 == 0):
            print("FizzBuzz")
        case let num where (num % 5 == 0):
            print("Buzz")
        case let num where (num % 3 == 0):
            print("Fizz")
        default:
            print(number)
        }
    }
}

fizzBuzz()
fizzBuzzAnother()

// MARK: - Checkpoint 4

//The challenge is this: write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches:
//
//You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
//If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
//You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
//If you can’t find the square root, throw a “no root” error.
//As a reminder, if you have number X, the square root of X will be another number that, when multiplied by itself, gives X. So, the square root of 9 is 3, because 3x3 is 9, and the square root of 25 is 5, because 5x5 is 25.

enum CustomError: Error {
    case outOfBounds, noRoot
}

func getSqrt(_ number: Int) throws -> Int {
    if number < 1 || number > 10000 {
        throw CustomError.outOfBounds
    }
    
    for i in 1...(number / 2 + 1) {
        if i * i == number {
            return i
        }
    }
    
    throw CustomError.noRoot
}
