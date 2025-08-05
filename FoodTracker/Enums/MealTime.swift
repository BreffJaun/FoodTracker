//
//  MealTime.swift
//  FoodTracker
//
//  Created by Jeff Braun on 05.08.25.
//

import Foundation

enum MealTime: String, CaseIterable, Identifiable {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    case snack = "Snack"

    var id: String { self.rawValue }
}

