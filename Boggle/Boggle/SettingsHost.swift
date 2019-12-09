//
//  SettingsHost.swift
//  Boggle
//
//  Created by Hugo Meyer on 12/6/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct SettingsHost: View {
    
    @EnvironmentObject var userData: UserData
    @Binding var grid: Grid
    
    let minutes: [String] = {
        var strings: [String] = []
        for i in 0..<60 {
            strings.append("\(i) min")
        }
        return strings
    }()
    
    let seconds: [String] = {
        var strings: [String] = []
        for i in 0..<60 {
            strings.append("\(i) sec")
        }
        return strings
    }()
    
    let screenWidth = UIScreen.main.bounds.width
    
    
    
    var body: some View {
        List {
            Text("Préférences")
            .bold()
            .font(.title)
         
            /*
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            */
            VStack(alignment: .leading, spacing: 20) {
                Text("Grille").bold()
                
                Picker("Grille", selection: self.$grid.dim) {
                    Text("4vs4").tag(4)
                    Text("5vs5").tag(5)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.top)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Complexité").bold()
                
                Picker("Complexité", selection: self.$grid.difficulty) {
                    ForEach(Grid.Difficulty.allCases, id: \.self) { difficulty in
                        Text(difficulty.rawValue).tag(difficulty)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.top)
            
            VStack(alignment: .leading, spacing: 20){
                Text("Compte à rebours").bold()
                HStack(spacing: 0) {
                    Picker(selection: self.$userData.countdownMinutes, label: Text("")) {
                        ForEach(0..<self.minutes.count) {
                            Text(self.minutes[$0]).tag($0)
                        }
                    }
                    .frame(maxWidth: screenWidth/2.5)
                    .clipped()
                    Picker(selection: self.$userData.countdownSeconds, label: Text("")) {
                        ForEach(0..<self.seconds.count) {
                            Text(self.seconds[$0]).tag($0)
                        }
                    }
                    .frame(maxWidth: screenWidth/2)
                    .clipped()
                    
                }
            }
            .padding(.top)
        }
    }
}

struct SettingsHost_Previews: PreviewProvider {
    static var previews: some View {
        SettingsHost(grid: .constant(.default))
    }
}
