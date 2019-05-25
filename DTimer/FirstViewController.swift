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
    
    var seconds = 60
    var timer = Timer()
    var isTimerRunning = false
    
    @IBAction func buttonstarttapped(_ sender: UIButton) {
        runTimer()
    }
    
    func runTimer() {
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(self.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @IBAction func buttonstoptapped(_ sender: UIButton) {
    }
    @IBAction func buttonrefreshtapped(_ sender: UIButton) {
    }
    
    
    @objc
    func updateTimer() {
        seconds -= 1
        timerlabel.text = "\(seconds)"
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        

    }
    
    
        
    }




