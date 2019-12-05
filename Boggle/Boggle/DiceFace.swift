//
//  DiceFace.swift
//  Boggle
//
//  Created by Hugo Meyer on 11/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct DiceFace: View {
    var letter: String
    var orientation: Double
    var gridSize: CGFloat
    var maxGridSize: CGFloat
    var gridSizeRatio: CGFloat{
        return gridSize/maxGridSize
    }
    var maxFont: CGFloat {letter == "Qu" ? 55 : 70}
    var confusingLetter: Bool {["M", "W", "Z", "N"].contains(letter)}
    var underline: String {confusingLetter ? "__" : ""}
    
    var body: some View {
        ZStack{
            Image("dice")
                .resizable()
            ZStack{
                
                Text(letter)
                    .font(.system(size: maxFont*gridSizeRatio))
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)

                Text(underline)
                    .offset(y: 20*gridSizeRatio)
                
            }
                .rotationEffect(.degrees(orientation))
                
              
        }
    }
}

struct DiceFace_Previews: PreviewProvider {
    static var previews: some View {
        DiceFace(letter: "A", orientation: 0.0, gridSize: 400, maxGridSize: 500)
    }
}
