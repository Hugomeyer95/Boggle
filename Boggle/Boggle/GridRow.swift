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
    
    var body: some View {
        HStack {
            DiceFace(letter: dices[0].activeLetter, orientation: dices[0].orientation, gridSize: gridSize, maxGridSize: maxGridSize)
                .offset(x: 15)
            DiceFace(letter: dices[1].activeLetter, orientation: dices[1].orientation, gridSize: gridSize, maxGridSize: maxGridSize)
                .offset(x: 5)
            DiceFace(letter: dices[2].activeLetter, orientation: dices[2].orientation, gridSize: gridSize, maxGridSize: maxGridSize)
                .offset(x: -5)
            DiceFace(letter: dices[3].activeLetter, orientation: dices[3].orientation, gridSize: gridSize, maxGridSize: maxGridSize)
                .offset(x: -15)
        }

    }
            
    
    
}

struct GridRow_Previews: PreviewProvider {
    static var previews: some View {
        GridRow(gridSize: 300, maxGridSize: 400, dices: diceData)
    }
}
