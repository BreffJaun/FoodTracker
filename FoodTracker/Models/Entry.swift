//
//  Entry.swift
//  FoodTracker
//
//  Created by Jeff Braun on 04.08.25.
//

import Foundation


struct Entry: Identifiable, Equatable, CustomStringConvertible {
    let id: UUID = UUID()
    var title: String
    var date: Date = Date()
    var calories: Int
    
    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return "\(title) – \(calories) kcal on \(dateFormatter.string(from: date))"
    }
}
