//
//  CountdownView.swift
//  Boggle
//
//  Created by Hugo Meyer on 12/4/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct CountdownView: View {
    
    var gridSizeRatio: CGFloat
    //@EnvironmentObject var userData: UserData
    @EnvironmentObject var userData: UserData
    
    var textColor: Color {userData.countdownTime<=5 ? Color.red : Color.white}
    var image: String {userData.countdownTime<=5 ? "hourglass_red" : "hourglass"}
    var timeDisplay: String {
        if self.userData.gamePlaying{
            return DisplayTime1(time: self.userData.countdownTime)
        }
        else{
            return DisplayTime2(minutes: self.userData.countdownMinutes, seconds: self.userData.countdownSeconds)
        }
        
    }
    
    var body: some View {
        ZStack{
            Image(systemName: "stopwatch")
                .foregroundColor(textColor)
                .font(.system(size: 30*self.gridSizeRatio))
                .offset(x: -45*self.gridSizeRatio, y: -2)
                /*
                .resizable()
                .frame(width: CGFloat(30)*self.gridSizeRatio, height: CGFloat(30)*self.gridSizeRatio)
                .offset(x: -40*self.gridSizeRatio)*/
                Text(timeDisplay)//
                .fontWeight(.semibold)
                .foregroundColor(self.textColor)
                .font(.system(size: 30*self.gridSizeRatio))
                .offset(x: 17*self.gridSizeRatio)
           
            
            //Spacer()
        }

    }
    
    func DisplayTime1 (time: Int) -> String{
        let min = Int(time/60)
        let newSec = time-60*min
        let secString = newSec<10 ? "0"+String(newSec) : String(newSec)
        let timeDisp = String(min)+":"+secString
        return timeDisp
    }
    func DisplayTime2 (minutes: Int, seconds: Int) -> String{
        let secString = seconds<10 ? "0"+String(seconds) : String(seconds)
        let timeDisp = String(minutes)+":"+secString
        return timeDisp
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(gridSizeRatio: 0.3).environmentObject(UserData())
    }
}
