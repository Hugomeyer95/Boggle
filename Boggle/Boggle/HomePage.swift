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
    //@EnvironmentObject var timerWrapper: TimerWrapper
    @State var test = false
    @State var countdownTimer = 60
    //@State var countdown = Countdown()
    
    var body: some View {
        ZStack{
            Color(red: 0, green: 0.3, blue: 0.6, opacity: 1.0)
                .edgesIgnoringSafeArea(.top)
                .edgesIgnoringSafeArea(.bottom)
            VStack{
                CountdownView(gridSizeRatio: gridSize/maxGridSize)
                Spacer()
                Spacer()
                Spacer()
                DiceGrid(maxGridSize: maxGridSize, gridSize: gridSize)
                    .environmentObject(self.userData)
                Spacer()
                if self.userData.gamePlaying == false{
                    GoButton(gridSize: gridSize)
                }
                else{
                    HStack{
                        RestartButton(gridSize: gridSize)
                        PauseButton(gridSize: gridSize)
                    }.frame(width: gridSize, height: gridSize/5)
                }
                
                    
                Spacer()
                Spacer()
                

            }
        }
            
    }
    
    

}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE"], id: \.self) { deviceName in
            HomePage()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        .environmentObject(UserData())
    }
}
