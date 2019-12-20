//
//  DiceGridSolutions.swift
//  Boggle
//
//  Created by Hugo Meyer on 12/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct DiceGridSolutions: View {
    
    var screenWidth = CGFloat(UIScreen.main.bounds.width)
    @Binding var grid: Grid
    
    
    
    var dicesSortedByLocation: [Dice] {
        return grid.dices.sorted {
            $0.location < $1.location
        }
    }
    
    
    var offsets: [Float] {self.generateOffsets()}
    
    var body: some View {
            
        VStack{
            ForEach(0..<self.grid.dim, id: \.self){ i in
                DiceRow(grid: self.grid, dices: Array(self.dicesSortedByLocation[(i*self.grid.dim)..<((i+1)*self.grid.dim)]), offsets: self.offsets)
                    .offset(y: CGFloat(self.offsets[i]))
            }
            
      
        }
        .padding(CGFloat(-1.6*Double(21-self.grid.spacing)+20))
            .frame(width: self.grid.sizeWithSolutions, height: self.grid.sizeWithSolutions)
            .background(Color(red: 0.6, green: 0.64, blue: 0.7, opacity: 1.0))
            .cornerRadius(30)
            .shadow(radius: 30)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color(red: 0.25, green: 0.3, blue: 0.4, opacity: 1), lineWidth: 14)
                .padding(EdgeInsets(top: 6, leading: 6, bottom: 6, trailing: 6))
            )
             

    }
    
    func generateOffsets() -> [Float]{
        let ratio = self.grid.dim == 4 ? 1.5 : 2
        let step = Float(21-self.grid.spacing)
        let boundary = Float(ratio)*step
        var offsets = Array(stride(from: -boundary, through: boundary, by: step))
        offsets.reverse()
        return offsets
    }
    
    
}


struct DiceGridSolutions_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE"], id: \.self) { deviceName in
            DiceGridSolutions(grid: .constant(.default))
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
