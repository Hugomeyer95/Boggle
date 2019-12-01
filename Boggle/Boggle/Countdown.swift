//
//  Countdown.swift
//  Boggle
//
//  Created by Hugo Meyer on 11/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

class Countdown {
    
    
    var countdownTimer = 60
    
    var timer:Timer?
    
    var countdownView = TimerString(countdown: 60)
    
    //var delegate: CountdownDelegate?
    
    func initCountdown() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
    }
    
    @objc func onTimerFires()
    {
        self.countdownTimer -= 1
        //self.delegate?.didUpdate(sender: self)
        self.countdownView.countdown = self.countdownTimer
        print(self.countdownTimer)
        if self.countdownTimer <= 0 {
            timer!.invalidate()
            timer = nil
        }
    }
}
/*
protocol CountdownDelegate {
    func didUpdate(sender: Countdown)
}


struct CountdownView: View {
    
    var body: some View {
        Text(String(self.countdown.timeLeft))
        .fontWeight(.light)
        .foregroundColor(Color.white)
        .font(.system(size: 50))
    }
}
*/

