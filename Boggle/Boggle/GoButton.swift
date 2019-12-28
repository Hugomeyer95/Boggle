//
//  GoButton.swift
//  Boggle
//
//  Created by Hugo Meyer on 12/5/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI
import AVFoundation

struct GoButton: View {
    
    @EnvironmentObject var userData: UserData
    var gridSize: CGFloat
    var rescale: Bool
    var color: Color {self.rescale ? Color.gray : Color(red: 0, green: 0.6, blue: 0.3, opacity: 1)}
    @State var blueSquare = UIView(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
    //let IDS = [1558, 1509, 1335, 1020, 1027, 1030, 1265]
    //let IDS = [1265, 1151, 1558]
    @State var counter = 1000
    @Binding var grid: Grid
    
    
    
    var body: some View {
        Button(action: {
            /*
            self.userData.gamePlaying.toggle()
            if self.userData.reset == false{
                var shuffleObj = DiceShuffle(dices: self.grid.dices, difficulty: self.grid.difficulty.rawValue)
                self.grid.dices = shuffleObj.dicesShuffled()
            }else{
                self.userData.reset.toggle()
            }
            self.userData.start(withTimeInterval: 1)
            self.userData.pause = false
            self.userData.gameEnd = false
            //AudioServicesPlayAlertSound(SystemSoundID(self.IDS[self.counter%7]))
            //AudioServicesPlayAlertSound(SystemSoundID(1030))
            
            //self.counter += 1
            
            //print(self.counter)
            
            self.grid.showSolutions = false
            */
   
            
            let sol = Solutions()
            sol.Scrapping()
                
            }) {
                Text("GO !")
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(width: gridSize, height: gridSize/5)
                    .font(.system(size: gridSize/10))
                    
                    .background(self.color)
                
            }
            .cornerRadius(15)
            .disabled(rescale)
            
        }
    }
    /*
    func curveAnimation(view: UIView, animationOptions: UIView.AnimationOptions, isReset: Bool) {
      let defaultXMovement: CGFloat = 240
        UIView.animate(withDuration: 1.0, delay: 0, options: animationOptions, animations: {
        view.transform = isReset ? .identity : CGAffineTransform.identity.translatedBy(x: defaultXMovement, y: 0)
      }, completion: nil)
    }
*/
struct GoButton_Previews: PreviewProvider {
    static var previews: some View {
        GoButton(gridSize: CGFloat(0.7), rescale: false, grid: .constant(.default))
    }
}
