//
//  Solutions.swift
//  Boggle
//
//  Created by Hugo Meyer on 12/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct SolutionsView: View {
    
    @Binding var isNavigationBarHidden: Bool
    @Binding var grid: Grid
    
    var body: some View {
        VStack {
            
            ScrollView {
                ForEach(0..<50) {
                    Text("Coucou \($0)")
                        .font(.system(size: 15))
                        
                }
            }
            .padding(.vertical, 15.0)
            .offset(y: 5)
            //.background(Color(hue: 0.273, saturation: 0.0, brightness: 0.965))
            
            //.frame(width: CGFloat(UIScreen.main.bounds.width)/3, height: self.grid.sizeWithSolutions)
            DiceGrid(grid: self.$grid)
            Spacer()
        }
        
        .navigationBarTitle("Solutions", displayMode: .inline)
        .onAppear {
            self.isNavigationBarHidden = false
        }
    }
}

struct SolutionsView_Previews: PreviewProvider {
    static var previews: some View {
        SolutionsView(isNavigationBarHidden: .constant(false), grid: .constant(Grid.default))
    }
}
