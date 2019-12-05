//
//  Proba.swift
//  Boggle
//
//  Created by Hugo Meyer on 12/2/19.
//  Copyright © 2019 Apple. All rights reserved.
//


import SwiftUI
import CoreLocation

struct Proba: Hashable, Codable, Identifiable {
    var id: Int
    var label: String
    var probabilities: [Double]
}
