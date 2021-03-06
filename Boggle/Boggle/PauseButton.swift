//
//  PauseButton.swift
//  Boggle
//
//  Created by Hugo Meyer on 12/5/19.
//  Copyright © 2019 Apple. All rights reserved.
//


import SwiftUI

struct PauseButton: View {
    
    @EnvironmentObject var userData: UserData
    var gridSize: CGFloat
    
    var body: some View {
        Button(action: {
            self.userData.pause.toggle()
        }) {
            Image(systemName: "pause")
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .frame(width: gridSize/3, height: gridSize/5)
                .font(.system(size: gridSize/10))
                .background(Color.orange)
                
        }
        .cornerRadius(15)
    }
}

struct PauseButton_Previews: PreviewProvider {
    static var previews: some View {
        PauseButton(gridSize: CGFloat(0.7))
    }
}
