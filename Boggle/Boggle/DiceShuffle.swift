//
//  DiceShuffle.swift
//  Boggle
//
//  Created by Hugo Meyer on 11/20/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

struct DiceShuffle {
    
    var dices: [Dice]
    let orientations: [Double] = [0.0, 90.0, 180.0, -90.0]
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var difficulty: String
    
    var proba: Proba {probaData.first(where: { $0.label ==  difficulty})!}

    mutating func dicesShuffled() -> [Dice] {
        print(proba.pAlphabet)
        let nbDices = self.dices.count
        let locations = 0..<nbDices
        let shuffledLocations = locations.shuffled()
        var cumSum = proba.pAlphabet.reduce(into: []) { $0.append(($0.last ?? 0) + $1) }
        cumSum.append(100.0)
        for i in 0..<nbDices{
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



