//
//  DrinkEntries.swift
//  FoodTracker
//
//  Created by Jeff Braun on 07.08.25.
//

import Foundation

var drinkDays: [DrinkDay] = [
    DrinkDay(date: Date(), goal: 2000, drinks: [
        Drink(amount: 250, type: .water),
        Drink(amount: 150, type: .tea),
        Drink(amount: 200, type: .coffee)
    ]),
    DrinkDay(date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, goal: 2000, drinks: [
        Drink(amount: 300, type: .water),
        Drink(amount: 150, type: .juice)
    ]),
    DrinkDay(date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, goal: 2000, drinks: [
        Drink(amount: 1000, type: .water),
        Drink(amount: 800, type: .tea),
        Drink(amount: 500, type: .coffee) // total = 2300
    ])
]
