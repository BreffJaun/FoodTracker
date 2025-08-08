//
//  DrinkType.swift
//  FoodTracker
//
//  Created by Jeff Braun on 07.08.25.
//

import Foundation

enum DrinkType: String, CaseIterable, Identifiable, Hashable, Equatable {
    case water = "Water"
    case coffee = "Coffee"
    case tea = "Tea"
    case juice = "Juice"
    case soda = "Soda"
    
    var id: String { rawValue }
}
