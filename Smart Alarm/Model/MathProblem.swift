
//
//  MathProblem.swift
//  Smart Alarm
//
//  Created by Foster Brown on 1/9/18.
//  Copyright © 2018 Foster Brown. All rights reserved.
//


/*
 A MathProblem object concists of a
 question and its respective answer
*/

import Foundation

class MathProblem: AnswerProtocol {
    var mathQuestion: String!
    var mathAnswer: String!
    
    
    private let rng = RandomProblemGenerator()
    
    
    //Gets the problem and the answer
    init(){
        getProblem()
        getAnswerForProblem()
    }

    //Gets the problem
    private func getProblem(){
        mathQuestion = rng.getProblem()
    }
    
    private func getAnswerForProblem(){
        let a: Answer = Answer(problem: mathQuestion)
        a.delegate = self
    }
    
    
    
    //Protocol Function
    func getAnswerProblem(mathAnswer: String) {
        self.mathAnswer = mathAnswer
        print("Answer: \(self.mathAnswer)")
    
    }
}
