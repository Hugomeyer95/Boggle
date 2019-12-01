//
//  DiceShuffle.swift
//  Boggle
//
//  Created by Hugo Meyer on 11/20/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

struct DiceShuffle {
    
    //@EnvironmentObject var userData: UserData
    var dices: [Dice]
    let orientations: [Double] = [0.0, 90.0, 180.0, -90.0]
    

    mutating func dicesShuffled() -> [Dice] {
        let locations = 0..<16
        let shuffledLocations = locations.shuffled()
        for i in 0..<16{
            let diceFaceIndex = Int.random(in: 0 ..< 6)
            let diceOrientationIndex = Int.random(in: 0 ..< 4)            
            dices[i].activeLetter = dices[i].letters[diceFaceIndex]
            dices[i].orientation = orientations[diceOrientationIndex]
            dices[i].location = shuffledLocations[i]
        }
        
        return dices
    }
}



