//
//  MathProblems.swift
//  Smart Alarm
//
//  Created by Foster Brown on 1/5/18.
//  Copyright © 2018 Foster Brown. All rights reserved.
//


/*
 
 A class that is pretty much a list
 that consists of MathProblems objects
 
 */

import Foundation

class MathBank {
    let amountOfProblems = 5
    
    var list = [MathProblem]()
    
    init(){
        
        //Sets a MathProblem object for each index in the array
        for _ in 0...amountOfProblems-1{
            
            let problem = MathProblem()
            
            /*
                ---------------------------------------
                Division is not configured right now
            //Remove overs and replace with sign
            problem.mathQuestion = problem.mathQuestion.replacingOccurrences(of: "over", with: "/")
                ---------------------------------------
            */

            list.append(problem)
            
            
        }
    }
    

    
    
}
