//
//  SolutionsButton.swift
//  Boggle
//
//  Created by Hugo Meyer on 12/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI



struct SolutionsButton: View {
    
    @Binding var grid: Grid
    
    var body: some View {
        Button(action: {self.grid.showSolutions.toggle()}){
            Text("Solutions")
              .fontWeight(.light)
              .foregroundColor(Color.white)
              .font(.system(size: 18))
              .offset(y: -8)
            //.frame(width: self.grid.size/5, height: self.grid.size/3.5)
        }
        .frame(width: 140, height: 80)
        .background(Color(hue: 0.995, saturation: 0.725, brightness: 0.444, opacity: 0.75))
        .cornerRadius(15)
        .rotationEffect(.degrees(-90))
        .offset(x: CGFloat(UIScreen.main.bounds.width)/2-20)
    }
}

struct SolutionsButton_Previews: PreviewProvider {
    static var previews: some View {
        SolutionsButton(grid: .constant(.default))
    }
}
