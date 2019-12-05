//
//  GoButton.swift
//  Boggle
//
//  Created by Hugo Meyer on 12/5/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct GoButton: View {
    
    @EnvironmentObject var userData: UserData
    var gridSize: CGFloat
    
    var body: some View {
        Button(action: {
            self.userData.gamePlaying.toggle()
            var shuffleObj = DiceShuffle(dices: self.userData.dices, probas: self.userData.probas[0].probabilities)
            self.userData.dices = shuffleObj.dicesShuffled()
            self.userData.start(withTimeInterval: 1)
        }) {
            Text("GO !")
                .fontWeight(.light)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .frame(width: gridSize, height: gridSize/5)
                .font(.system(size: gridSize/10))
                
                .background(Color.green)
                
        }
        .cornerRadius(15)
    }
}

struct GoButton_Previews: PreviewProvider {
    static var previews: some View {
        GoButton(gridSize: CGFloat(0.7))
    }
}
