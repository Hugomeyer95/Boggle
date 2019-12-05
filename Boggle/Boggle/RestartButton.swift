//
//  RestartButton.swift
//  Boggle
//
//  Created by Hugo Meyer on 12/5/19.
//  Copyright © 2019 Apple. All rights reserved.
//


import SwiftUI

struct RestartButton: View {
    
    @EnvironmentObject var userData: UserData
    var gridSize: CGFloat
    
    var body: some View {
        Button(action: {
            self.userData.ResetTimer()
            self.userData.reset.toggle()
        }) {
            Image(systemName: "arrow.clockwise")
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .frame(width: gridSize/3, height: gridSize/5)
                .font(.system(size: gridSize/10))
                .background(Color.blue)
        }
        .cornerRadius(15)
        
    }
}

struct RestartButton_Previews: PreviewProvider {
    static var previews: some View {
        RestartButton(gridSize: CGFloat(0.7))
    }
}
