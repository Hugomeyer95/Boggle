//
//  TimerString.swift
//  Boggle
//
//  Created by Hugo Meyer on 11/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct TimerString: View {
    
    var countdown: Int
    
    
    
    var body: some View {
        Text(String(countdown))
        .fontWeight(.light)
        .foregroundColor(Color.white)
        .font(.system(size: 50))
    }
}

struct TimerString_Previews: PreviewProvider {
    static var previews: some View {
        TimerString(countdown: 60)
    }
}
