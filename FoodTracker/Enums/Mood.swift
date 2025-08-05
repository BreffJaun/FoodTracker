//
//  Mood.swift
//  FoodTracker
//
//  Created by Jeff Braun on 05.08.25.
//

import Foundation

enum Mood: String, CaseIterable, Identifiable {
    case happy = "Happy"
    case neutral = "Neutral"
    case sad = "Sad"
    case stressed = "Stressed"

    var id: String { self.rawValue }
}

