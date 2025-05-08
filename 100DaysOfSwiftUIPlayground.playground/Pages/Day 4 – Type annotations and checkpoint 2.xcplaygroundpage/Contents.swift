import Foundation

// MARK: Day 4 – Type annotations and checkpoint 2

let count = 1...10

// for loop
for number in count {
    // to skip an item and continue to the next one, you'll use the keyword continue
    if number == 3 {
        continue
    }
    if number == 6 {
        print("Human, I'm done counting!")
        // to exit a loop, use the break keyword
        break
    }
    print ("Number is now \(number)")
}

// If you don’t use the constant that for loops give you (as in number in the code above), you should use an underscore instead so that Swift doesn’t create needless values:
for _ in count {
    print("Number")
}
let artists = ["Don Moen", "M W Smith", "Sinach", "Jamie Grace"]

for artist in artists {
    print("You're currently listening to: \(artist)")
}

// while loop
var age = 1

while age < 25 {
    print("You can't manage the estate yet :(")
    age += 1
}

print("Now you are well able!")

var loginAttempt = 1

// the code will at least run once before the condition is checked
repeat {
    print("Enter your login details")
    loginAttempt += 1
} while (loginAttempt <= 3)

print("Correct details or not, you're now logged in")

// This is a nested loop
// to break out of two loops simultaneously, we need to add a label to the outside loop, and then use break {name_of_outside_loop label} in the inner loop
outerLoop: for x in 1...5 {
    for y in 1...5 {
        let multiply = y * x
        print("x * y is \(multiply)")

        if multiply == 20 {
            print("We're done here!")
            break outerLoop
        }
    }
}

var counter = 0

// Infinite loop
while true {
    print ("I'll print forever, I'll even crash your system!👹")
    counter += 1

    if counter == 5 {
        print("Yo!, I won't let you👼🏿")
        break
    }
}

// checkpoint 2
let names = ["Alice", "Grace", "Bob", "Charlie", "David", "Eve", "Frank", "Grace", "Hannah", "Charlie", "Isaac", "Jack"]
print("There is \(names.count) names")

let uniqueNames = Set(names)
print("There is \(uniqueNames.count) unique names")
