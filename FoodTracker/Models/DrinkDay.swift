//
//  DrinkDay.swift
//  FoodTracker
//
//  Created by Jeff Braun on 07.08.25.
//

import Foundation

struct DrinkDay: Hashable, Identifiable {
    let id = UUID()
    let date: Date
    let goal: Double
    var drinks: [Drink]
    
    var totalDrunk: Double {
        drinks.reduce(0) { $0 + $1.amount }
    }
}
