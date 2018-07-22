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
    
    private let baseUrl: String = "https://newton.now.sh/simplify/"
    private var answer: String = ""
    
    //To pass the answer and problem over once network call is terminated
    var delegate: AnswerProtocol?
    
    init(problem: String){
        makeAnswerRequest(with: problem)
    }
    
    private func makeAnswerRequest(with problem: String){
        
        /* ie. "https://newton.now.sh/simplify/2+3" */
        let newURL: String = baseUrl + problem
        
        //Make the request to the url
        Alamofire.request(newURL).responseJSON { response in
            print("Sending request to: \(newURL)")
            print("Response result: \(response.result)")
            
            if response.result.isSuccess{
                let json: JSON = JSON(response.result.value!)
                self.parseJsonAnswer(json: json)
            }
            else{
                print("Error: \(response.error!)")
            }
        }
    }
    
    private func parseJsonAnswer(json: JSON){
        if let answer = json["result"].string{
            
            /*
                Confusing line but pretty much get rid of white space and replace overs with a slash
                Yeah bro only if I have division problems configured so for now
                the raw answer will be passed
             
                //delegate?.getAnswerProblem(mathAnswer: answer.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "over", with: "/") )
            */
            
            delegate?.getAnswerProblem(mathAnswer: answer);
            //print("Answer: \(answer.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "over", with: "/"))")
            print("Answer: " + answer)
        }
        else{
            print("Error no answer")
        }
        
    }
    
    
    
}
