/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a list of landmarks.
*/

import SwiftUI

struct DiceGrid: View {
    
    var maxGridSize: CGFloat
    var gridSize: CGFloat
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
                GridRow(gridSize: self.gridSize, maxGridSize: self.maxGridSize, dices: Array(self.dicesSortedByLocation[(i*self.grid.dim)..<((i+1)*self.grid.dim)]), offsets: self.offsets)
                    .offset(y: CGFloat(self.offsets[i]))
            }
            
      
        }
        .padding(CGFloat(-1.6*Double(21-self.grid.spacing)+20))
            .frame(width: self.grid.size, height: self.grid.size)
            .background(Color(red: 0.9, green: 0.55, blue: 0.0, opacity: 1.0))
            .cornerRadius(30)
            .shadow(radius: 30)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color(red: 0.5, green: 0.2, blue: 0.07, opacity: 1), lineWidth: 14)
                .padding(EdgeInsets(top: 6, leading: 6, bottom: 6, trailing: 6))
            )
             

    }
    
    func generateOffsets() -> [Float]{
        var offsets: [Float] = Array(stride(from: -1.5*Float(21-self.grid.spacing), through: 1.5*Float(21-self.grid.spacing), by: Float(21-self.grid.spacing)))

        offsets.reverse()
        return offsets
    }
    
    
}


struct DiceGrid_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE"], id: \.self) { deviceName in
            DiceGrid(maxGridSize: 500, gridSize: 300, grid: .constant(.default))
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
