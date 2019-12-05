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
    var gridSizeRatio: CGFloat{
        return gridSize/maxGridSize
    }
    
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
            VStack(spacing: 5){
                Spacer()
                ZStack{
                    HStack{
                        
                        SettingsButton(gridSizeRatio: gridSizeRatio).offset(x: 40*gridSizeRatio)
                        Spacer()
                        if self.userData.gamePlaying == true{
                            StopButton(gridSizeRatio: gridSizeRatio)
                                .offset(x: -40*gridSizeRatio)
                        }
                        
                    }
                    
                    CountdownView(gridSizeRatio: gridSizeRatio)
                }
                
                Spacer()
                Spacer()
                Spacer()
                ZStack{
                    DiceGrid(maxGridSize: maxGridSize, gridSize: gridSize)
                        .environmentObject(self.userData)
                    if self.userData.pause{
                        BoggleCover(gridSize: gridSize)
                        if self.userData.reset == false{
                            Text("PAUSE")
                                .fontWeight(.light)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                                .font(.system(size: gridSize/6))
                                .opacity(0.6)
                        }
                    }
                }
                
                Spacer()
                if self.userData.gamePlaying == false{
                    GoButton(gridSize: gridSize)
                }
                else{
                    HStack{
                        Spacer()
                        RestartButton(gridSize: gridSize)
                        Spacer()
                        if self.userData.pause{
                            PlayButton(gridSize: gridSize)
                        }
                        else{
                            PauseButton(gridSize: gridSize)
                        }
                        Spacer()
                    }//.frame(width: gridSize, height: gridSize/5)
                    
                }
                    
                Spacer()
                Spacer()
                

            }
            //.edgesIgnoringSafeArea(.top)
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
