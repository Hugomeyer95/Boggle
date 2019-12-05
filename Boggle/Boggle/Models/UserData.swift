/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A model object that stores app data.
*/

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var dices = diceData
    @Published var probas = probaData
    @Published var diceUse = false
    @Published var countdownTime = 150
    @Published var gamePlaying = false
    
    let willChange = PassthroughSubject<UserData, Never>()
    
    var timer : Timer!
    func start(withTimeInterval interval: Double) {
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
            self.willChange.send(self)
            self.countdownTime -= 1
            if self.countdownTime <= 145{
                print("Finish")
                self.timer.invalidate()
                self.countdownTime = 150
                self.gamePlaying.toggle()
            }
        }
    }
}

