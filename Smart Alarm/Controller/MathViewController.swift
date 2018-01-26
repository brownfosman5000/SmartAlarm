//
//  MathViewController.swift
//  Smart Alarm
//
//  Created by Foster Brown on 1/4/18.
//  Copyright © 2018 Foster Brown. All rights reserved.
//

import UIKit
import AVFoundation
import ProgressHUD

////INitiailze ui using the mathbank and shit
class MathViewController: UIViewController{
    
    let alarmURL = Bundle.main.url(forResource: "OriginalAlarm", withExtension: "wav")
    var alarmSound: AVAudioPlayer?
    var mathBank = MathBank()
    var questionNumber: Int = 0
    
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var answer: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //initializeKeyboard()
        initializeUI()
        initializeAlarmSound()
        
        //Infinetly play...
        alarmSound?.numberOfLoops = -1
        alarmSound?.play()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func initializeKeyboard(){
        answer.keyboardType = UIKeyboardType.numberPad
    }
    
    @IBAction func submitAnswer(_ sender: UIButton) {
        checkAnswer()
    }
    
    
    
    //Initialize AVAudioPlayer object
    func initializeAlarmSound(){
        do{
            alarmSound = try AVAudioPlayer(contentsOf: alarmURL!)
            print("Initialized AVAudioPlayer")
        }
            
        catch{
            alarmSound = nil
            print("OriginalAlarm.wav not found..")
        }
    }
    
    
    func initializeUI(){
        answer.text = ""
        question.text = mathBank.list[questionNumber].mathQuestion
    }
    

    //Checks answer
    func checkAnswer(){
        if answer.text == mathBank.list[questionNumber].mathAnswer{
            print("Correct Answer")
            ProgressHUD.showSuccess()
            nextQuestion()
        }
        else{
            print("Wrong Answer")
            ProgressHUD.showError()
        }
    }
    
    //Progress to next question
    func nextQuestion(){
        print(questionNumber)
        print(mathBank.list.count)
        if questionNumber == mathBank.list.count-1{
            print("Alarm Stopped")
            alarmSound?.stop()
            self.dismiss(animated: true, completion: nil)
        }
        else{
            questionNumber += 1
            initializeUI()
        }
    }
    

    
    //Close keyboard when touched anywhere on screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        answer.resignFirstResponder()
    }
    

    
    
    
    
    

}
    
    
    
    
    
    
    
    
    
    
    
    


