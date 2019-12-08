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
    
    @Binding var grid: Grid
    
    var body: some View {
        Button(action: {
            self.userData.ResetTimer()
            for index in 0..<self.grid.dices.count {
                self.grid.dices[index].activeLetter = "X"//self.grid.dices[index].defaultLetter
                self.grid.dices[index].location = index+1
                self.grid.dices[index].orientation = 0.0//self.grid.dices[index].defaultOrientation
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
        StopButton(gridSizeRatio: CGFloat(0.7), grid: .constant(.default))
    }
}
