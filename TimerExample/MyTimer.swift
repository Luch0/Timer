//
//  MyTimer.swift
//  TimerExample
//
//  Created by Luis Calle on 7/13/18.
//  Copyright © 2018 Lucho. All rights reserved.
//

import Foundation

protocol MyTimerDelegate: class {
    func updateTimer(seconds: Int)
}

class MyTimer {
    
    var seconds: Int
    var currentSeconds: Int
    var timer = Timer()
    var isTimerRunning: Bool = false
    weak var delegate: MyTimerDelegate?
    
    init(seconds: Int) {
        self.seconds = seconds
        self.currentSeconds = seconds
    }
    
    func startTimer() {
        if isTimerRunning { return }
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTheTimer), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    func stopAndResetTimer() {
        timer.invalidate()
        isTimerRunning = false
        self.resetTimer()
    }
    
    @objc private func updateTheTimer() {
        self.currentSeconds -= 1
        delegate?.updateTimer(seconds: self.currentSeconds)
    }
    
    func pauseTimer() {
        
    }
    
    func resetTimer() {
        self.currentSeconds = self.seconds
    }
    
}
