/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A model object that stores app data.
*/

import Combine
import SwiftUI
import AVFoundation

final class UserData: ObservableObject {
    @Published var dices = diceData
    @Published var probas = probaData
    @Published var diceUse = false
    @Published var countdownTime = 10
    @Published var gamePlaying = false
    @Published var pause = false
    @Published var reset = false
    
    let willChange = PassthroughSubject<UserData, Never>()
    
    var timer : Timer!
    func start(withTimeInterval interval: Double) {
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
            self.willChange.send(self)
            if self.pause == false{
                self.countdownTime -= 1
            }
            print(self.countdownTime)
            if self.countdownTime <= 5 && self.countdownTime > 0{
                AudioServicesPlayAlertSound(SystemSoundID(1071))
            }
            if self.countdownTime <= 0{
                AudioServicesPlayAlertSound(SystemSoundID(1151))
                self.ResetTimer()
            }
        }
    }
    
    func ResetTimer (){
        self.timer.invalidate()
        self.countdownTime = 10
        self.gamePlaying.toggle()
    }
}

