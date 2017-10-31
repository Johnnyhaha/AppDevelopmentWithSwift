/*:
 ## Exercise - Types and Type Safety
 
 Declare two variables, one called `firstDecimal` and one called `secondDecimal`. Both should have decimal values. Look at both of their types by holding Option and clicking on the variable name.
 */
var firstDecimal = 3.0
var secondDecimal = 9.4
/*:
 Declare a variable called `trueOrFalse` and give it a boolean value. Try to assign it to `firstDecimal` like so: `firstDecimal = trueOrFalse`. Does it compile? Print a statement to the console explaining why not, and remove the line of code that will not compile.
 */
var trueOrFalse = true
//firstDecimal = trueOrFalse
print("trueOrFalse is a Bool and firstDecimal is a Double, therefore you cannot assign the value of one to the other.")
/*:
 Declare a variable and give it a string value. Then try to assign it to `firstDecimal`. Does it compile? Print a statement to the console explaining why not, and remove the line of code that will not compile.
 */
var favoriteColor = "Blue"
//firstDecimal = favoriteColor
print("favoriteColor is a String and firstDecimal is a Double, therefore you cannot assign the value of one to the other.")
/*:
 Finally, declare a variable with a whole number value. Then try to assign it to `firstDecimal`. Why won't this compile even though both variables are numbers? Print a statement to the console explaining why not, and remove the line of code that will not compile.
 */
var wholeNumber = 10
//firstDecimal = wholeNumber
print("Even though both wholeNumber and firstDecimal are numbers, one is an Int and the other is a Double, so the value of one cannot be assigned to the other.")
//: [Previous](@previous)  |  page 7 of 10  |  [Next: App Exercise - Tracking Different Types](@next)
