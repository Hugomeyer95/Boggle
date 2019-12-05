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
    
    
    var body: some View {
        ZStack{
            Image("hourglass")
                .resizable()
                .offset(x: CGFloat(-50)*self.gridSizeRatio)
                .frame(width: CGFloat(30)*self.gridSizeRatio, height: CGFloat(30)*self.gridSizeRatio)
            Text(DisplayTime(time: self.userData.countdownTime))//
            .fontWeight(.semibold)
            .foregroundColor(Color.white)
            //Spacer()
        }

    }
    
    func DisplayTime (time: Int) -> String{
        let min = Int(time/60)
        let newSec = time-60*min
        let secString = newSec<=10 ? "0"+String(newSec) : String(newSec)
        let timeDisp = String(min)+":"+secString
        return timeDisp
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(gridSizeRatio: 0.3).environmentObject(UserData())
    }
}
