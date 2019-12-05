//
//  BoggleCover.swift
//  Boggle
//
//  Created by Hugo Meyer on 12/5/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct BoggleCover: View {
    
    var gridSize: CGFloat
    
    var body: some View {
        Rectangle()
            .frame(width: gridSize-6, height: gridSize-6)
            .cornerRadius(25.0)
            .foregroundColor(Color(red: 0.5, green: 0.2, blue: 0.07, opacity: 1))
    }
}

struct BoggleCover_Previews: PreviewProvider {
    static var previews: some View {
        BoggleCover(gridSize: 200)
    }
}
