//
//  HomePage.swift
//  Boggle
//
//  Created by Hugo Meyer on 11/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct HomePage: View {
    
    @State var grid = Grid(dim: 4)
    @State var tempGrid = Grid.default
    @EnvironmentObject var userData: UserData
    @State var showingSettings = false
    @State var showingRescale = false
    @State var isNavigationBarHidden: Bool = true
    
    var pauseString: some View {
        Text("PAUSE")
        .fontWeight(.light)
        .foregroundColor(Color.white)
        .multilineTextAlignment(.center)
        .font(.system(size: self.grid.size/6))
        .opacity(0.6)
    }
    
    var settingsButton: some View {
        Button(action: {
            self.showingSettings.toggle()
            if self.userData.pause == false && self.userData.gamePlaying == true{
                self.userData.pause.toggle()
            }
        }) {
            Image(systemName: "gear")
                .foregroundColor(Color.white)
                .font(.system(size: 30*self.grid.ratio))
                .accessibility(label: Text("Settings"))
        }
    }
    
    var rescaleButton: some View {
        Button(action: {
            self.showingRescale.toggle()
        }) {
            Image(systemName: showingRescale ? "aspectratio.fill" : "aspectratio")
                .foregroundColor(Color.white)
                .font(.system(size: 30*self.grid.ratio))
                .accessibility(label: Text("Grid rescale"))
        }
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 0, green: 0.3, blue: 0.6, opacity: 1.0)
                    .edgesIgnoringSafeArea(.top)
                    .edgesIgnoringSafeArea(.bottom)
                VStack(spacing: 5){
                    ZStack{
                        HStack{
                            //SettingsButton(gridSizeRatio: gridSizeRatio).offset(x: 40*gridSizeRatio)
                            settingsButton
                                .offset(x: 40*self.grid.ratio)
                                .sheet(isPresented: $showingSettings) {
                                    SettingsHost(grid: self.$tempGrid, showingSettings: self.$showingSettings)
                                        .environmentObject(self.userData)
                                        .onAppear {
                                            self.tempGrid = self.grid
                                        }
                                        .onDisappear {
                                            self.tempGrid.checkIfNbDicesChanged()
                                            self.grid = self.tempGrid
                                        }
                                     
                                }
                            Spacer()
                            if self.userData.gamePlaying == true{
                                StopButton(gridSizeRatio: self.grid.ratio, grid: self.$grid)
                                    .offset(x: -40*self.grid.ratio)
                            }
                            else{
                                rescaleButton.offset(x: -40*self.grid.ratio)
                            }
                        }
                        CountdownView(gridSizeRatio: self.grid.ratio)
                    }
                    if showingRescale{
                        RescaleSliders(grid: self.$grid)
                    }else{
                        Spacer()
                        
                    }
                    Spacer()
                    ZStack{
                        HStack{
                            DiceGrid(grid: self.$grid)
                            /*
                            if self.grid.showSolutions{
                                
                            }*/
                        }
                        if self.userData.pause{
                            BoggleCover(gridSize: self.grid.maxPossibleSize)
                            if self.userData.reset == false{
                                pauseString
                            }
                        }
                        //if self.userData.gameEnd == true && self.grid.showSolutions == false{
     
                        NavigationLink(destination: SolutionsView(isNavigationBarHidden: self.$isNavigationBarHidden, grid: self.$grid), isActive: self.$grid.showSolutions){ EmptyView() }
                        
                        SolutionsButton(grid: self.$grid)
                       // }
                    }
                    
                    Spacer()
                    if self.userData.gamePlaying == false{
                        GoButton(gridSize: self.grid.size, rescale: self.showingRescale, grid: self.$grid)
                    }
                    else{
                        HStack{
                            Spacer()
                            RestartButton(gridSize: self.grid.maxPossibleSize)
                            Spacer()
                            if self.userData.pause{
                                PlayButton(gridSize: self.grid.maxPossibleSize)
                            }
                            else{
                                PauseButton(gridSize: self.grid.maxPossibleSize)
                            }
                            Spacer()
                        }//.frame(width: gridSize, height: gridSize/5)
                    }
                    Spacer()
                    Spacer()
                }
                //.edgesIgnoringSafeArea(.top)
            }
            .navigationBarTitle("")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
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
