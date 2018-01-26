//
//  Answer.swift
//  Smart Alarm
//
//  Created by Foster Brown on 1/25/18.
//  Copyright © 2018 Foster Brown. All rights reserved.
//
//Feeds from ran gen and returns both to mathbank
import Foundation
import Alamofire
import SwiftyJSON

protocol AnswerProtocol {
    func getAnswerProblem(mathAnswer: String)
}
class Answer{
    
    private let baseUrl: String = "https://newton.now.sh"
    private var answer: String = ""
    
    //To pass the answer and problem over once network call is terminated
    var delegate: AnswerProtocol?
    
    init(problem: String){
        makeAnswerRequest(problem: problem)
    }
    
    private func makeAnswerRequest(problem: String){
        
        let newURL: String = baseUrl + "/simplify" + "/" + problem
        Alamofire.request(newURL).responseJSON { response in
            print("Sending request to: \(newURL)")
            print("Response result: \(response.result)")
            
            if response.result.isSuccess{
                let json: JSON = JSON(response.result.value!)
                self.parseJsonAnswer(json: json)
            }
            else{
                print("Error: \(String(describing: response.error))")
            }
        }
    }
    
    private func parseJsonAnswer(json: JSON){
        if let answer = json["result"].string{
            self.answer = answer.replacingOccurrences(of: "over", with: "/")
            
            delegate?.getAnswerProblem(mathAnswer: answer)
            print("Answer: \(answer)")
        }
        else{
            print("Error no answer")
        }
        
    }
    
    
    
}
