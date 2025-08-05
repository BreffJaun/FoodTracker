//
//  EntryType.swift
//  FoodTracker
//
//  Created by Jeff Braun on 05.08.25.
//

import Foundation

enum EntryType: String, Equatable, CaseIterable, Identifiable {
    case meals = "Meals"
    case snacks = "Snacks"
    case drinks = "Drinks"
    case deserts = "Deserts"
    
    var id: String { self.rawValue }
}
