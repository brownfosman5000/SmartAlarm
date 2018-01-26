//
//  RandomProblemGenerator.swift
//  Smart Alarm
//
//  Created by Foster Brown on 1/25/18.
//  Copyright © 2018 Foster Brown. All rights reserved.
//

import Foundation

class RandomProblemGenerator{
    //over means divide
    private let mathSymbols = ["+","-","*","over"]//,"^"],"(",")"]
    private let maxNumberOfCharsAndNumber = 9
    private var numberOfChars: Int!
    private var problem: String = "p"
    
    func getProblem()->String{
        print("PROBLEM: \(String(problem.dropFirst()))")
        return String(problem.dropFirst())
    }
    func clear(){
        problem = "p"
    }
    func getRandomSimplificationProblem(){
        initializeNumberOfChars()
        for _ in 1...numberOfChars{
            
            //If a number add a symbol bruh
            if checkIfNumber(number: problem.last!){
                problem += mathSymbols[Int(arc4random()) % mathSymbols.count]
            }
            //Add a random number to problem
            else{
                problem += getRandomNumber()
            }
        }
     
        // If it ends in operation get another number
        if checkIfEndsInOp(problem: problem){
            print("Ends in a op")
            problem += getRandomNumber()
        }

        print("Problem: \(problem)")
        
    }
    
    //Gets a random number of characters for problem
    private func initializeNumberOfChars(){
        repeat{
            numberOfChars = Int(arc4random()) % maxNumberOfCharsAndNumber
        }while numberOfChars == 0 || numberOfChars == 1 || numberOfChars == 2
        
        print("Number of Characters: \(numberOfChars)")
    }
    
    //Gets random number and converts it to string
    private func getRandomNumber()->String{
        let randomNumber = Int(arc4random()) % maxNumberOfCharsAndNumber
        print(randomNumber)
        return String(randomNumber)
    }
    
    
    //Checks if character in string is a number
    private func checkIfNumber(number: String.Element) -> Bool{
        //String element so I need to change to string to int :)
        if let _: Int = Int(String(number)){
            return true
        }
        else{
            return false
        }
    }
    
//    
    //Checks if ends in operation
    private func checkIfEndsInOp(problem: String) ->Bool{
        for indexNumber in 0...mathSymbols.count-1{
            print("Last char of problem: \(String(describing: problem.last))")
            print("Math symbols amount:  \(mathSymbols[indexNumber])")
            if String(describing: problem.last!) == String(mathSymbols[indexNumber]){
                print("There was a op symbol")
                return true
            }
        }
        print("Doesn't end in op symbol")
        return false
    }
    
    
    
    
    
    
}
