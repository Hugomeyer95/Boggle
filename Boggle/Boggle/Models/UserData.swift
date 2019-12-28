/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A model object that stores app data.
*/

import Combine
import SwiftUI
import AVFoundation

final class UserData: ObservableObject {
    @Published var probas = probaData
    @Published var countdownMinutes = 2
    @Published var countdownSeconds = 30
    @Published var countdownTime = 10
    @Published var gamePlaying = false
    @Published var pause = false
    @Published var reset = false
    @Published var gameEnd = false
    
    let willChange = PassthroughSubject<UserData, Never>()
    
    var timer : Timer!
    func start(withTimeInterval interval: Double) {
        self.countdownTime = self.countdownMinutes*60 + self.countdownSeconds
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
            self.willChange.send(self)
            if self.pause == false{
                self.countdownTime -= 1
            }
            if self.countdownTime <= 5 && self.countdownTime > 0 && self.pause == false{
                AudioServicesPlayAlertSound(SystemSoundID(1071))
            }
            if self.countdownTime <= 0 && self.pause == false{
                AudioServicesPlayAlertSound(SystemSoundID(1030))
                self.ResetTimer()
                self.gameEnd = true
            }
        }
    }
    
    func ResetTimer (){
        self.timer.invalidate()
        self.countdownTime = self.countdownMinutes*60 + self.countdownSeconds
        self.gamePlaying.toggle()
    }
}

