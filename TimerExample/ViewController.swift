//
//  ViewController.swift
//  TimerExample
//
//  Created by Luis Calle on 7/13/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startTimerButton: UIButton!
    
    var myTimer = MyTimer(seconds: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTimer.delegate = self
        timerLabel.text = myTimer.seconds.description
    }

    @IBAction func startTimerPressed(_ sender: UIButton) {
        if !myTimer.isTimerRunning { timerLabel.text = myTimer.seconds.description }
        myTimer.startTimer()
    }
    
}

extension ViewController: MyTimerDelegate {
    func updateTimer(seconds: Int) {
        if seconds == 0 {
            timerLabel.text = "Finished"
            myTimer.stopAndResetTimer()
        } else {
            timerLabel.text = seconds.description
        }
    }
}
