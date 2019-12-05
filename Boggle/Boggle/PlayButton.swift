//
//  PlayButton.swift
//  Boggle
//
//  Created by Hugo Meyer on 12/5/19.
//  Copyright © 2019 Apple. All rights reserved.
//


import SwiftUI

struct PlayButton: View {
    
    @EnvironmentObject var userData: UserData
    var gridSize: CGFloat
    
    var body: some View {
        Button(action: {
            self.userData.pause.toggle()
        }) {
            Image(systemName: "play")
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .frame(width: gridSize/3, height: gridSize/5)
                .font(.system(size: gridSize/10))
                .background(Color.green)
                
        }
        .cornerRadius(15)
    }
}

struct PlayButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayButton(gridSize: CGFloat(0.7))
    }
}
