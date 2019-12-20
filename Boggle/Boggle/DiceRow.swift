/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A single row to be displayed in a list of landmarks.
*/
import SwiftUI

struct DiceRow: View {
    
    var grid: Grid
    var dices: [Dice]
    var offsets: [Float]
    
    var body: some View {
        HStack{
            ForEach(0..<dices.count, id: \.self){ index in
                DiceFace(grid: self.grid, letter: self.dices[index].activeLetter, orientation: self.dices[index].orientation)
                .offset(x: CGFloat(self.offsets[index]))
            }
        }
    }
            
    
    
}

