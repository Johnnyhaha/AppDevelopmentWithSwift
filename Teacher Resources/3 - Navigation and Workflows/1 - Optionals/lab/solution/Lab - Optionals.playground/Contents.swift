/*:
 ## Exercise - Optionals

 Imagine you have an app that asks the user to type his/her age. When your app allows a user the input text, what is captured for you is given as a `String`. However, you want to store this information as an `Int`. Can you foresee a few scenarios where the user input doesn't match the type you want to store?
 
 Declare a constant `userInputAge` of type `String` and assign it "34e" to simulate a typo while typing age. Then declare a constant `userAge` of type `Int` and use the `Int` initializer and pass in `userInputAge`. What error do you get?
*/


/*:
 Go back and change the type of `userAge` to `Int?`, and print the value of `userAge`. Why is `userAge`'s value `nil`? Provide your answer in a comment or print statement below.
 */


/*:
 Now go back and fix the typo on `userInputAge` so that its value is "34". Now print `userAge`. Is there anything about the value printed that seems off?
 */


/*:
 Print `userAge` again, but this time unwrap `userAge` using the bang operator.
 */


/*:
 Now use optional binding to unwrap `userAge`. If `userAge` has a value, print it to the console.
 */


/*:
 
 */


//: [Previous](@previous) | [Next](@next)
/*:
 Create a `Computer` struct with two properties, `ram` and `yearManufactured`, where both parameters are of type `Int`. Create a failable initializer that will only create an instance of `Computer` if `ram` is greater than 0, and if `yearManufactured` is greater than 1970, and less than 2017.
 */


/*:
 Create two instances of `Computer?` using the failable initializer. One instance should use values that will have a value within the optional, and the other should result in `nil`. Use if-let syntax to unwrap each of the `Computer?` objects and print the `ram` and `yearManufactured` if the optional contains a value.
 */

