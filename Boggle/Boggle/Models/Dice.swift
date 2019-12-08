/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The model for an individual landmark.
*/

import SwiftUI
import CoreLocation

struct Dice: Hashable, Codable, Identifiable {
    var id: Int
    //var letters: [String]
    //var defaultLetter: String
    //var defaultOrientation: Double
    var activeLetter: String
    var orientation: Double
    var location: Int
    
    init(id: Int, location: Int, activeLetter: String = "X", orientation: Double = 0.0) {
        self.id = id
        self.activeLetter = activeLetter
        self.orientation = orientation
        self.location = location
    }
}


