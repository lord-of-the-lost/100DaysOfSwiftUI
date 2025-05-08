import Foundation

// MARK: Day 3 – Arrays, dictionaries, sets, and enums

let testScore = 45
let examScore = 30

let addition = testScore + examScore

let substraction = testScore - examScore

let multiply = testScore * examScore

let division = 50 / 5

// Returns the remainder after a division operation
let modulus = 15 % 6

// Addition
let result = 10 + 10

// String concatenation
let firstPart = "Welcome home "
let finalPart = "Africans!"
let welocmeMessage = firstPart + finalPart

// We can even join arrays together using + operator
let initialArray = ["East", "West"]
let additionalArray = ["North", "South"]
let cardinalPoint = initialArray + additionalArray

var score = 70
let attendanceMark = 10

score += attendanceMark

// Similarly, you can add one string to another using +=
var fact = "Nigeria is the giant of "
fact += "Africa"

// comparison operators
let first =  19
let second = 23

// equality operators: checks two values are the same
first == second

// inequality operators: checks two values are not the same
first != second

// greater than, greater than or equal to
first > second
first >= second

// less than, less than or equal to
first < second
first <= second

// Each of these operators also works with strings, because strings have a natural alphabetical order
// Prints true
"a" < "b"
// Prints false
"Africa" > "America"

let firstAge =  50
let secondAge = 50

// if the condition is true, the code in the bracket will run
if firstAge > secondAge {
    // Swift built-in function to print output
    print("The first dude is older.")
} // You can chain conditions together using else if
else if (firstAge == secondAge) {
    print("Wow, you guys are mate!")
}
//  If you want you can provide alternative code to run if the conditions are false, using else
else {
    print("The second dude is older.")
}

// Combining conditions -  && (pronounced “and”) and || (pronounced “or”) are used to combine conditions together
let x = 9
let y = 2

// &&
if (x > 1 && y > 1) {
    print("The two conditions are met")
}

// ||
if (x > 1 || y > 10) {
    print("One of the conditions is correct")
}

// Use case
let loggedIn = true
let authorized = false

if loggedIn && authorized {
    print("Welcome to Wakanda!")
}

let firstCard = 11
let secondCard = 10
// ternary operator
print(firstCard == secondCard ? "Cards are the same" : "Cards are different")

// This code is same as an if..else statement
if firstCard == secondCard {
    print("Cards are the same")
} else {
    print("Cards are different")
}

let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
default:
    print("Enjoy your day!")
}

// If you want execution to continue on to the next case, use the fallthrough
switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough
    // the default case must be there to ensure all possible values are covered.
default:
    print("Enjoy your day!")
}

let studResult = 85

switch studResult {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}

for i in 1...100 {
   print("Currently on Day \(i)")
}

for i in 1..<8 {
   print("Currently on Day \(i)")
}
