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
            
        }) {
            Text("Restart")
                .fontWeight(.light)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
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
