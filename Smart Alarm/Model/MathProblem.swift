
//
//  MathProblem.swift
//  Smart Alarm
//
//  Created by Foster Brown on 1/9/18.
//  Copyright © 2018 Foster Brown. All rights reserved.
//

import Foundation

class MathProblem: AnswerProtocol {
    var mathQuestion: String!
    var mathAnswer: String!
    
    
    private let rng = RandomProblemGenerator()
    
    
    
    init(){
        getProblem()
        getAnswerForProblem()
    }

    
    private func getProblem(){
        rng.getRandomSimplificationProblem()
        mathQuestion = rng.getProblem()
        rng.clear()
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
