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
    @State var blueSquare = UIView(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
    //let IDS = [1057, 1071, 1113, 1200, 1201, 1202, 1203, 1204, 1205]
    
    let IDS = [1265, 1151, 1558]
    @State var counter = 0
    var body: some View {
            Button(action: {
                
                self.userData.gamePlaying.toggle()
                if self.userData.reset == false{
                    var shuffleObj = DiceShuffle(dices: self.userData.dices, probas: self.userData.probas[0].probabilities)
                    self.userData.dices = shuffleObj.dicesShuffled()
                }else{
                    self.userData.reset.toggle()
                }
                self.userData.start(withTimeInterval: 1)
                self.userData.pause = false
                
                /*
                print(self.counter)
                AudioServicesPlayAlertSound(SystemSoundID(self.IDS[self.counter%3]))
                self.counter += 1
 */
                //self.curveAnimation(view: self.blueSquare, animationOptions: .curveEaseIn, isReset: false)
            }) {
                Text("GO !")
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(width: gridSize, height: gridSize/5)
                    .font(.system(size: gridSize/10))
                    
                    .background(Color.green)
                
            }
            .cornerRadius(15)
            
    }
    
    func curveAnimation(view: UIView, animationOptions: UIView.AnimationOptions, isReset: Bool) {
      let defaultXMovement: CGFloat = 240
        UIView.animate(withDuration: 1.0, delay: 0, options: animationOptions, animations: {
        view.transform = isReset ? .identity : CGAffineTransform.identity.translatedBy(x: defaultXMovement, y: 0)
      }, completion: nil)
    }
}

struct GoButton_Previews: PreviewProvider {
    static var previews: some View {
        GoButton(gridSize: CGFloat(0.7))
    }
}
