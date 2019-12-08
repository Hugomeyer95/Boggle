//
//  Grid.swift
//  Boggle
//
//  Created by Hugo Meyer on 12/7/19.
//  Copyright © 2019 Apple. All rights reserved.
//
import Foundation
import SwiftUI

struct Grid {
    var dices: [Dice]
    var difficulty: Difficulty
    var dim: Int
    var scale: Double
    var maxSize: CGFloat
    var maxPossibleSize: CGFloat
    var minSize: CGFloat
    var size: CGFloat
    var ratio: CGFloat
    var spacing: CGFloat
    
    
    static let `default` = Self(dim: 4, difficulty: .medium, scale: 1, maxSize: 500, minSize: 350, spacing: 15)
    
    init(dim: Int = 4, difficulty: Difficulty = .medium, scale: Double = 1, maxSize: CGFloat = 500, minSize: CGFloat = 350, spacing: CGFloat = 15) {
        self.difficulty = difficulty
        self.dim = dim
        self.dices = []
        self.scale = scale
        self.maxSize = maxSize
        self.maxPossibleSize = min(maxSize, CGFloat(UIScreen.main.bounds.width))
        self.minSize = minSize
        self.size = self.maxPossibleSize
        self.ratio = self.size/self.maxSize
        self.spacing = spacing
        self.initDices()
        
        
    }
    
    mutating func initDices(){
        
        //var tempDices: [Dice] = []
        let diceTotalNb = self.dim*self.dim
        
        for i in 0..<diceTotalNb{
            self.dices.append(Dice(id: i+1, location: i+1))
        }
    }
    
    mutating func checkIfNbDicesChanged(){
        let diceTotalNb = self.dim*self.dim
        

        
        if self.dices.count != diceTotalNb{
            self.dices = []
            for i in 0..<diceTotalNb{
                self.dices.append(Dice(id: i+1, location: i+1))
            }
        }
    }
    
    enum Difficulty: String, CaseIterable {
        case low = "basse"
        case medium = "moyenne"
        case high = "haute"
    }

}
