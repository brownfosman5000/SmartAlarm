//
//  ViewController.swift
//  Smart Alarm
//
//  Created by Foster Brown on 12/25/17.
//  Copyright © 2017 Foster Brown. All rights reserved.
//

import UIKit
import UserNotifications
import ProgressHUD

class ViewController: UIViewController,UNUserNotificationCenterDelegate {

    @IBOutlet weak var time: UIDatePicker!
    let center = UNUserNotificationCenter.current()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        requestNotifications()
        center.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Gets the date from picker
    @IBAction func setAlarm(_ sender: UIButton) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        ProgressHUD.showSuccess("Alarm Set")
        //date.text = dateFormatter.string(from: time.date)
        //print(dateFormatter.string(from: time.date))
        
        configureNotificationInformation()

    }
    
    @IBAction func cancel(_ sender: UIButton) {
        center.removeAllPendingNotificationRequests()
        ProgressHUD.showSuccess("Alarm Canceled")
    }
    
    
    
    //Requests permissions from user
    func requestNotifications(){
        center.requestAuthorization(options: [.alert,.badge,.sound]) { (false, nil) in}
    }
    
    
    
    //Configure info surrounding the notification and set it
    func configureNotificationInformation(){
        var trigger: UNCalendarNotificationTrigger!
        let contentObject = UNMutableNotificationContent()
        
        setContentForNotifications(content: contentObject)
        
        trigger = setTimeForTrigger()
        
        //Set the request
        let request = UNNotificationRequest(identifier: "MorningAlarm", content: contentObject, trigger: trigger)
        //Add the request
        //Closure--...
        center.add(request) { (nil) in}
    }
    
    
    
    //Set the content
    func setContentForNotifications(content: UNMutableNotificationContent){
        content.title = NSString.localizedUserNotificationString(forKey: "Math Time: Get yo ass up Nigga", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "You have 5 problems to complete..", arguments: nil)
        content.sound = UNNotificationSound(named: "OriginalAlarm.wav")
    }
    
    
    
    //Set time for the trigger to go off
    func setTimeForTrigger() -> UNCalendarNotificationTrigger {
        //print (String(describing: date.text))
        let components = Calendar.current.dateComponents([.hour, .minute], from: time.date)
        let hour = components.hour!
        let minute = components.minute!
        
        print(hour)
        print(minute)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        return trigger

    }
    
    

    //Asychronous function that will be called and then we want to go to
    // the next screen with math problems

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        performSegue(withIdentifier: "goToMathProblems", sender: self)
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        if response.actionIdentifier == UNNotificationDismissActionIdentifier{
            print("Dismissed: ")
        }
        
        else if response.actionIdentifier == UNNotificationDefaultActionIdentifier{
            print("Default View: " )
            performSegue(withIdentifier: "goToMathProblems", sender: self)
            
        }
        
    }
    

    
    
    
    



    
    

    
    


}

