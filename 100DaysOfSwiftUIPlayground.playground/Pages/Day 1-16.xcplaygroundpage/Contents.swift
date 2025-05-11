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

// MARK: - Checkpoint 5

//Your input is this:
//
//let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
//Your job is to:
//
//Filter out any numbers that are even
//Sort the array in ascending order
//Map them to strings in the format “7 is a lucky number”
//Print the resulting array, one item per line
//So, your output should be as follows:
//
//7 is a lucky number
//15 is a lucky number
//21 is a lucky number
//31 is a lucky number
//33 is a lucky number
//49 is a lucky number

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

func checkLuckyNumbers(_ array: [Int]) {
    array
        .sorted()
        .filter { !$0.isMultiple(of: 2) }
        .map {
            print("\($0) is a lucky number")
        }
}

checkLuckyNumbers(luckyNumbers)

// MARK: - Checkpoint 6

//To check your knowledge, here’s a small task for you: create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down. Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate its input somehow?

struct Car {
    private let model: String
    private let numberOfSeats: Int
    private var currentGear: UInt
    
    private mutating func changeCurrentGear(needUp: Bool) {
        switch needUp {
        case true: currentGear += 1
        case false: currentGear -= 1
        }
    }
}

// MARK: - Checkpoint 7

//Your challenge is this: make a class hierarchy for animals, starting with Animal at the top, then Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog, and Persian and Lion as subclasses of Cat.
//
//But there’s more:
//
//The Animal class should have a legs integer property that tracks how many legs the animal has.
//The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
//The Cat class should have a matching speak() method, again with each subclass printing something different.
//The Cat class should have an isTame Boolean property, provided using an initializer.


class Animal {
    let legsCount: Int
    
    init(legsCount: Int) {
        self.legsCount = legsCount
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(legsCount: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legsCount: legsCount)
    }
    
    func speak() {
        print("Meow")
    }
}

class Dog: Animal {
    func speak() {
        print("Bark!")
    }
}

final class Corgi: Dog {
    override func speak() {
        super.speak()
        print("bark-bark")
    }
}

final class Poodle: Dog {
    override func speak() {
        super.speak()
        print("barkkkk")
    }
}

final class Persian: Cat {
    override func speak() {
        super.speak()
        print("meooooow")
    }
}

final class Lion: Cat {
    override func speak() {
        super.speak()
        print("meooooow arrr")
    }
}

// MARK: - Checkpoint 8

//Your challenge is this: make a class hierarchy for animals, starting with Animal at the top, then Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog, and Persian and Lion as subclasses of Cat.
//
//But there’s more:
//
//The Animal class should have a legs integer property that tracks how many legs the animal has.
//The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
//The Cat class should have a matching speak() method, again with each subclass printing something different.
//The Cat class should have an isTame Boolean property, provided using an initializer.

protocol Building {
    var roomCount: Int { get }
    var cost: Int { get set }
    var agent: String { get }
    func summary()
}

extension Building {
    func summary() {
        print("""
        ***SUMMARY***
        Building Type : \(Self.self)
        Room : \(roomCount)
        Cost : \(cost)$
        Agent : \(agent)
        """)
    }
}

struct House: Building {
    let roomCount: Int
    var cost: Int
    let agent: String
}

struct Office: Building {
    let roomCount: Int
    var cost: Int
    let agent: String
}

// MARK: - Checkpoint 9

//Your challenge is this: write a function that accepts an optional array of integers, and returns one randomly. If the array is missing or empty, return a random number in the range 1 through 100.
//
//If that sounds easy, it’s because I haven’t explained the catch yet: I want you to write your function in a single line of code. No, that doesn’t mean you should just write lots of code then remove all the line breaks – you should be able to write this whole thing in one line of code.

func randomNumber(array: [Int]?) -> Int {
    array?.randomElement() ?? Int.random(in: 1...100)
}

let arr1 = [1000,1002,1004,1006,1008,1010,1012,1014,1016,1018,1020]
let arr2: [Int]? = nil

print(randomNumber(array: arr1))
print(randomNumber(array: arr2))
