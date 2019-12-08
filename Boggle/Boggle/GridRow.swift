/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A single row to be displayed in a list of landmarks.
*/
import SwiftUI

struct GridRow: View {
    
    var gridSize: CGFloat
    var maxGridSize: CGFloat
    var dices: [Dice]
    var offsets: [Float]
    
    var body: some View {
        HStack{
            ForEach(0..<dices.count, id: \.self){ index in
                DiceFace(letter: self.dices[index].activeLetter, orientation: self.dices[index].orientation, gridSize: self.gridSize, maxGridSize: self.maxGridSize)
                .offset(x: CGFloat(self.offsets[index]))
            }
        }
    }
            
    
    
}

