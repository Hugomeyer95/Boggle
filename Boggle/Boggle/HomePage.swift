//
//  HomePage.swift
//  Boggle
//
//  Created by Hugo Meyer on 11/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct HomePage: View {
    
    
    var maxGridSize: CGFloat = 500
    var screenWidth = CGFloat(UIScreen.main.bounds.width)
    var gridSize: CGFloat {
        return ((maxGridSize < screenWidth) ? 500 : screenWidth)
    }
    //var timer:Timer?
    
    
    @EnvironmentObject var userData: UserData
    @State var gamePlaying = false
    @State var test = false
    @State var countdownTimer = 60
    //@State var countdown = Countdown()
    
    var body: some View {
        ZStack{
            Color(red: 0, green: 0.3, blue: 0.6, opacity: 1.0)
                .edgesIgnoringSafeArea(.top)
                .edgesIgnoringSafeArea(.bottom)
            VStack{
                Spacer()
                //countdown.countdownView
                Spacer()
                Spacer()
                DiceGrid(maxGridSize: maxGridSize, gridSize: gridSize)
                    .environmentObject(self.userData)
                Spacer()
                Button(action: {
                    self.gamePlaying.toggle()
                    var shuffleObj = DiceShuffle(dices: self.userData.dices)
                    self.userData.dices = shuffleObj.dicesShuffled()
                    //self.countdown.initCountdown()
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
                    
                Spacer()
                Spacer()
                

            }
        }
            
    }
    
    

}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPad Pro (11-inch)"], id: \.self) { deviceName in
            HomePage()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        .environmentObject(UserData())
    }
}
