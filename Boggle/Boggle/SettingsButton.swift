//
//  SettingsButton.swift
//  Boggle
//
//  Created by Hugo Meyer on 12/5/19.
//  Copyright © 2019 Apple. All rights reserved.
//


import SwiftUI

struct SettingsButton: View {
    
    @EnvironmentObject var userData: UserData
    var gridSizeRatio: CGFloat
    
    var body: some View {
        Button(action: {
            
        }) {
            Image(systemName: "gear")
                .foregroundColor(Color.white)
                //.frame(width: 40, height: 40)
                //.frame(width: gridSize/4, height: gridSize/4)
                .font(.system(size: 30*self.gridSizeRatio))
                //.background(Color.blue)
        }
        
    }
}

struct SettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButton(gridSizeRatio: CGFloat(0.7))
    }
}
