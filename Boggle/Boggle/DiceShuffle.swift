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
    var probas: [Double]
    let orientations: [Double] = [0.0, 90.0, 180.0, -90.0]
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    

    mutating func dicesShuffled() -> [Dice] {
        let locations = 0..<16
        let shuffledLocations = locations.shuffled()
        let cumSum = probas.reduce(into: []) { $0.append(($0.last ?? 0) + $1) }
        for i in 0..<16{
            let diceFaceIndex = Int.random(in: 0 ..< 6)
            let diceOrientationIndex = Int.random(in: 0 ..< 4)
            let proba = Double.random(in: 0 ..< 100)
            //dices[i].activeLetter = dices[i].letters[diceFaceIndex]
            let element = cumSum.first(where: { $0 > proba })!
            let alphabetIndex1 = cumSum.firstIndex(of: element)
            let alphabetIndex2 = alphabet.index(alphabet.startIndex, offsetBy: alphabetIndex1!)
            let letter = String(alphabet[alphabetIndex2])
            dices[i].activeLetter = letter == "Q" ? "Qu" : letter
            dices[i].orientation = orientations[diceOrientationIndex]
            dices[i].location = shuffledLocations[i]
        }
        
        return dices
    }
}



