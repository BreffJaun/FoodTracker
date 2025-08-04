//
//  Entry.swift
//  FoodTracker
//
//  Created by Jeff Braun on 04.08.25.
//

import Foundation


struct Entry: Identifiable, Equatable {
    let id: UUID = UUID()
    var title: String
    var date: Date = Date()
    var calories: Int
}
