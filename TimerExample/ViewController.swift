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
    @IBOutlet weak var startOrPauseTimerButton: UIButton!
    
    var myTimer = MyTimer(seconds: 25000)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTimer.delegate = self
        timerLabel.text = secondsToFullTime(seconds: myTimer.seconds)
    }

    @IBAction func startOrPauseTimerPressed(_ sender: UIButton) {
        if myTimer.isTimerPaused {
            startOrPauseTimerButton.setTitle("pause", for: .normal)
        } else {
            startOrPauseTimerButton.setTitle("resume", for: .normal)
        }
        myTimer.startOrPauseTimer()
    }
    
}

extension ViewController: MyTimerDelegate {
    func updateTimer(seconds: Int) {
        if seconds == 0 {
            timerLabel.text = "Finished"
            myTimer.stopAndResetTimer()
        } else {
            timerLabel.text = secondsToFullTime(seconds: seconds)
        }
    }
    
    func secondsToFullTime(seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = seconds / 60 % 60
        let seconds = seconds % 60
        return "\(hours):\(minutes):\(seconds)"
    }
}
