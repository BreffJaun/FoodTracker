//
//  EntryListView.swift
//  FoodTracker
//
//  Created by Jeff Braun on 04.08.25.
//

import SwiftUI

struct EntryListView: View {
    
    @State var entries = entriesList
    @State private var meals = mealsList
    @State private var snacks = snacksList
    @State private var drinks = drinksList
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Calorie Tracker")
                .font(.largeTitle)
                .bold()
                .padding(.horizontal)
            
            List {
//                ForEach(entries) { entry in
//                    EntryListItemView(entries: $entries, entry: entry)
//                        .listRowSeparator(.hidden)
//                        .listRowBackground(Color.clear)
//                }
                Section(header: Text("Meals").font(.headline)) {
                    ForEach(meals) { entry in
                        EntryListItemView(entries: $meals, entry: entry)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                    }
                }

                Section(header: Text("Snacks").font(.headline)) {
                    ForEach(snacks) { entry in
                        EntryListItemView(entries: $snacks, entry: entry)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                    }
                }

                Section(header: Text("Drinks").font(.headline)) {
                    ForEach(drinks) { entry in
                        EntryListItemView(entries: $drinks, entry: entry)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}

//#Preview {
//    EntryListView()
//}
