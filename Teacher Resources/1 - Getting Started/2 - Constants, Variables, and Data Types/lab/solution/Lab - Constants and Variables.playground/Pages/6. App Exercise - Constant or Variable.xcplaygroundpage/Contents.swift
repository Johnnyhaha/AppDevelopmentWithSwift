/*:
 ## App Exercise - Fitness Tracker: Constant or Variable?
 
 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 There are all sorts of things that a fitness tracking app needs to keep track of in order to display the right information to the user. Similar to the last exercise, declare either a constant or a variable for each of the following items, and assign each a sensible value. Be sure to use proper naming conventions.
 
 - Name: The user's name
 - Age: The user's age
 - Number of steps taken today: The number of steps that a user has taken today
 - Goal number of steps: The user's goal for number of steps to take each day
 - Average heart rate: The user's average heart rate over the last 24 hours
 */
let name = "James"
print("Name should be constant because it is relatively fixed over time.")
var age = 26
print("Age is an inherently variable trait.")
var numberOfSteps = 8139
print("Number of steps taken will change frequently throughout the day, making it best suited to be a variable.")
let goalSteps = 10000
print("The goal number of steps will either not change, or change infrequently enough that it is likely best kept a constant.")
var averageHeartRate = 55
print("Average heart rate will be constantly updated based on current heart rate, so it should be a variable.")
/*:
 Now go back and add a line after each constant or variable declaration. On those lines, print a statement explaining why you chose to declare the piece of information as a constant or variable.
 */
//: [Previous](@previous)  |  page 6 of 10  |  [Next: Exercise - Types and Type Safety](@next)
