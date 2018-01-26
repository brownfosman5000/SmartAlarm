//
//  MathProblems.swift
//  Smart Alarm
//
//  Created by Foster Brown on 1/5/18.
//  Copyright © 2018 Foster Brown. All rights reserved.
//

import Foundation

class MathBank {
    let amountOfProblems = 5
    
    var list = [MathProblem]()
    
    init(){
        for _ in 0...amountOfProblems-1{
            
            let problem = MathProblem()
            
            //Remove overs and replace with sign
            problem.mathQuestion = problem.mathQuestion.replacingOccurrences(of: "over", with: "/")
            

            list.append(problem)
            
            
        }
    }
    

    
    
}
