//
//  FirstViewController.swift
//  DTimer
//
//  Created by Nino Liner on 25.05.19.
//  Copyright © 2019 Nino Liner. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var datepicker: UIDatePicker!
    @IBOutlet weak var timerlabel: UITextField!
    @IBOutlet weak var ButtonStartPause: UIButton!
    
    
    var startdate = TimeInterval()
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = true
    var setTitle = "Stop"
    var setTitle2 = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let initalisationdate = Calendar.current.date(bySettingHour: 0, minute: 5, second: 0, of: Date()) ?? Date()
        datepicker.setDate(initalisationdate, animated: true)
        datepickervaluechanged(datepicker)
    }
    
    @IBAction func datepickervaluechanged(_ sender: UIDatePicker) {

        print("datepickervaluechanged")
        let date = sender.date
        let components = Calendar.current.dateComponents([.hour, . minute], from: date)
        let hour = components.hour!
        let minute = components.minute!
        timerlabel.text = String(format: "%02d", hour) + ":" + String(format: "%02d", minute) + ":00"
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
      
    }
    
    
    func renameClassButton(sender: UIButton) {
        ButtonStartPause.setTitle("Start", for: .normal)
    }
    
    
    
    @objc
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(self.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    
    @objc
    func updateTimer() {
        startdate = startdate-1
        timerlabel.text = timeString(time: startdate)
        
        //TO DO check if timer is 0
    }
    
    @IBAction func buttonstoptapped(_ sender: UIButton) {
//        if isTimerRunning == false {
//            runTimer()
//        }
        
        
        if self.resumeTapped == false {
            timer.invalidate()
            self.resumeTapped = true
            ButtonStartPause.setTitle("Resume", for: .normal)
        } else {
            startdate = datepicker.countDownDuration
            runTimer()
            self.resumeTapped = false
        }
        
        if setTitle2 == 0{
            setTitle2 = 1
            ButtonStartPause.setTitle("Stop", for: .normal)
        }else{
            setTitle2 = 0
        ButtonStartPause.setTitle("Start", for: .normal)
        }
    }
    
    
    @IBAction func buttonrefreshtapped(_ sender: UIButton) {
        timer.invalidate()
      
        isTimerRunning = false
        let initalisationdate = Calendar.current.date(bySettingHour: 0, minute: 5, second: 0, of: Date()) ?? Date()
        timerlabel.text = dateString(date: initalisationdate)
        datepicker.setDate(initalisationdate, animated: true)
        datepickervaluechanged(datepicker)
        ButtonStartPause.setTitle("Start", for: .normal)
        
    }

    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    func dateString(date:Date) -> String {
        
        
        // *** create calendar object ***
        let calendar = Calendar.current

        // *** Get All components from date ***
        let components = calendar.dateComponents([.hour, .year, .minute], from: date)
        print("All Components : \(components)")
        
        // *** Get Individual components from date ***
        let hours = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
       return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    






}
