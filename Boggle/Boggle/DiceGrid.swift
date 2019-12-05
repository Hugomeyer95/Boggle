/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a list of landmarks.
*/

import SwiftUI

struct DiceGrid: View {
    @EnvironmentObject private var userData: UserData
    
    var maxGridSize: CGFloat
    var gridSize: CGFloat
    var screenWidth = CGFloat(UIScreen.main.bounds.width)
    
    var dicesSortedByLocation: [Dice] {
        userData.dices.sorted {
            $0.location < $1.location
        }
    }
    
    var body: some View {
            
            VStack{
                
                GridRow(gridSize: gridSize, maxGridSize: maxGridSize, dices: Array(dicesSortedByLocation[0..<4]))
                    .offset(y: CGFloat(15))
                GridRow(gridSize: gridSize, maxGridSize: maxGridSize, dices: Array(dicesSortedByLocation[4..<8]))
                    .offset(y: CGFloat(5))
                GridRow(gridSize: gridSize, maxGridSize: maxGridSize, dices: Array(dicesSortedByLocation[8..<12]))
                    .offset(y: CGFloat(-5))
                GridRow(gridSize: gridSize, maxGridSize: maxGridSize, dices: Array(dicesSortedByLocation[12..<16]))
                    .offset(y: CGFloat(-15))
                
            }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .frame(width: gridSize, height: gridSize)
                .background(Color(red: 0.9, green: 0.55, blue: 0.0, opacity: 1.0))
                .cornerRadius(30)
                .shadow(radius: 30)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color(red: 0.5, green: 0.2, blue: 0.07, opacity: 1), lineWidth: 14)
                    .padding(EdgeInsets(top: 6, leading: 6, bottom: 6, trailing: 6))
                )
             

    }
}


struct DiceGrid_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE"], id: \.self) { deviceName in
            DiceGrid(maxGridSize: 500, gridSize: 300)
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        .environmentObject(UserData())
    }
}
