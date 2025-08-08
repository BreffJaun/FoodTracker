//
//  Drink.swift
//  FoodTracker
//
//  Created by Jeff Braun on 07.08.25.
//

import Foundation

struct Drink: Hashable, Identifiable {
    let id = UUID()
    let amount: Double
    let type: DrinkType
}
