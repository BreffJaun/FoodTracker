//
//  TabView.swift
//  FoodTracker
//
//  Created by Jeff Braun on 06.08.25.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var meals = mealsList
    @State private var snacks = snacksList
    @State private var drinks = drinksList
    @State private var deserts = dessertsList
    
    var body: some View {
        TabView {
            Tab("Calories", systemImage: "fork.knife.circle") {
                DashboardView(meals: $meals, snacks: $snacks, drinks: $drinks, deserts: $deserts)
            }
            
            Tab("Entries", systemImage: "entry.lever.keypad") {
                EntryListView(meals: $meals, snacks: $snacks, drinks: $drinks, deserts: $deserts)
            }
        }
    }
}

//#Preview {
//    TabBarView()
//}
