//
//  RandomProblemGenerator.swift
//  Smart Alarm
//
//  Created by Foster Brown on 1/25/18.
//  Copyright © 2018 Foster Brown. All rights reserved.
//

/*
    Responsible for creating a problem involving the math symbols array(operations)
*/
import Foundation

class RandomProblemGenerator{
    
    //over means divide
    private let mathSymbols = [Character](arrayLiteral: "+","-","*")//,"/")//,"^"],"(",")"]
    private let numCharsNeeded = 3
    private let maxNumberOfCharsAndNumber = 9
    

    //Gets a random problem
    func getProblem() -> String {
        // Get number of chars
        let numberOfChars = initializeNumberOfChars()
        
        // Get an initial number to populate problem and start loop
        var problem: String = getRandomNumber()
        
        //Populate the problem
        for _ in 1...numberOfChars{
            
            //If a number add a symbol bruh
            if checkIfNumber(number: problem.last!){
                //Pick one of the symbols from index 0 to 3
                problem += String(mathSymbols[Int(arc4random()) % mathSymbols.count])
            }
                //Add a random number to problem
            else{
                problem += getRandomNumber()
            }
        }
        
        // If it ends in operation get another number
        if checkIfEndsInOp(checkChar: problem.last!){
            print("Ends in a op")
            problem += getRandomNumber()
        }
        
        
        print("Problem: \(problem)")
        return problem
        
    }

    
    //Gets a random number of characters for problem and returns it
    private func initializeNumberOfChars() -> Int{
        var numberOfChars: Int?
        
        repeat{
            //Get a number between 0 and maxNumberOfCharsAndNumber
            numberOfChars = Int(arc4random()) % maxNumberOfCharsAndNumber
            
            //numCharsNeeded is the number of characters needed for a problem ie. 2 + 3
        }while numberOfChars! < numCharsNeeded
        
        
//        print("Number of Characters: \(numberOfChars)")
        return numberOfChars!
    }
    
    //Gets random number and converts it to string
    private func getRandomNumber()->String{
        let randomNumber = Int(arc4random()) % maxNumberOfCharsAndNumber
//        print(randomNumber)
        return String(randomNumber)
    }
    
    
    
    
    //Checks if character in string is a number
    private func checkIfNumber(number: String.Element) -> Bool{
        /*  String element so I need to change to string to int :)
            If i can typecast to int using optional chaining
            then it is an int else not
        */
        if let _: Int = Int(String(number)){
            return true
        }
        else{
            return false
        }
    }

  
    //Checks if ends in operation
    private func checkIfEndsInOp(checkChar: String.Element) ->Bool{
        for indexNumber in 0...mathSymbols.count-1{

            //The r is for the over may have a better way to do this
//            if String(describing: problem.last!) == String(mathSymbols[indexNumber]) && String(describing: problem.last!) != "r" {
            if checkChar == mathSymbols[indexNumber] || checkChar == "r"{
//                print("There was a op symbol")
                return true
            }
        }
//        print("Doesn't end in op symbol")
        return false
    }
    
    
    
    
    
    
}
