//
//  StopButton.swift
//  Boggle
//
//  Created by Hugo Meyer on 12/5/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct StopButton: View {
    
    @EnvironmentObject var userData: UserData
    var gridSizeRatio: CGFloat
    
    var body: some View {
        Button(action: {
            self.userData.ResetTimer()
            for index in 0..<self.userData.dices.count {
                self.userData.dices[index].activeLetter = self.userData.dices[index].defaultLetter
                self.userData.dices[index].location = index+1
                self.userData.dices[index].orientation = self.userData.dices[index].defaultOrientation
            }
        }) {
            Image(systemName: "stop.circle")
                .foregroundColor(Color.red)
                .font(.system(size: 40*self.gridSizeRatio))
                //.background(Color.blue)
        }
        
    }
}

struct StopButton_Previews: PreviewProvider {
    static var previews: some View {
        StopButton(gridSizeRatio: CGFloat(0.7))
    }
}
