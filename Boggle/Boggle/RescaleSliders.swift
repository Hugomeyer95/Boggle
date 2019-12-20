//
//  RescaleSliders.swift
//  Boggle
//
//  Created by Hugo Meyer on 12/10/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI


struct RescaleSliders: View {
    
    @Binding var grid: Grid
    
    var body: some View {
        VStack(spacing: -10){
            VStack{
                Text("Taille de grille")
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .font(.system(size: self.grid.ratio*30))
                    .offset(y: 10)
                Slider(value: self.$grid.size, in: self.grid.minSize...self.grid.maxPossibleSize, step: 1)
                    .frame(width: 450*self.grid.ratio)
            }
            VStack{
                Text("Espacement des dés")
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .font(.system(size: self.grid.ratio*30))
                    .offset(y: 10)
                Slider(value: self.$grid.spacing, in: 1...20, step: 1)
                    .frame(width: 450*self.grid.ratio)
            }
        
        }
    }
}

struct RescaleSliders_Previews: PreviewProvider {
    static var previews: some View {
        RescaleSliders(grid: .constant(.default))
    }
}
