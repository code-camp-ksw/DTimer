//
//  FirstViewController.swift
//  DTimer
//
//  Created by Nino Liner on 25.05.19.
//  Copyright © 2019 Nino Liner. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var timerlabel: UITextField!
    @IBOutlet weak var ButtonStartPause: UIButton!
    @IBAction func SliderTime(_ sender: UISlider){
        seconds = Int(sender.value)
        timerlabel.text = "00:00:" + String(seconds)
    }
    @IBOutlet weak var SliderTime2: UISlider!
    
    
    var seconds = 60
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false
    var setTitle = "Stop"

    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if isTimerRunning == false {
            runTimer()
        }
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
        seconds -= 1
        timerlabel.text = timeString(time: TimeInterval(seconds))
        
        if (seconds == 0)
        { timer.invalidate()
        }
    }
    
    @IBAction func buttonstoptapped(_ sender: UIButton) {
        if self.resumeTapped == false {
            timer.invalidate()
            self.resumeTapped = true
            ButtonStartPause.setTitle("Resume", for: .normal)
            SliderTime2.setValue(60, animated: true)
            
        }
        else {
            runTimer()
            self.resumeTapped = false
        };ButtonStartPause.setTitle("Stop", for: .normal)
    }
    @IBAction func buttonrefreshtapped(_ sender: UIButton) {
        timer.invalidate()
        seconds = 00
        timerlabel.text = String(format:"%02i:%02i:%02i", 0, 0, seconds)
        isTimerRunning = false
    }

    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    
        
    
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    





}
