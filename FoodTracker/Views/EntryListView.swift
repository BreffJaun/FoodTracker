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
    @State private var deserts = dessertsList
    @State var isMealsExpanded = true
    @State var isSnacksExpanded = true
    @State var isDrinksExpanded = true
    @State var isDesertsExpanded = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Calorie Tracker")
                .font(.largeTitle)
                .bold()
                .padding(.horizontal, 16)
            
            List {
//                ForEach(entries) { entry in
//                    EntryListItemView(entries: $entries, entry: entry)
//                        .listRowSeparator(.hidden)
//                        .listRowBackground(Color.clear)
//                }
                Section("Meals", isExpanded: $isMealsExpanded) {
                    ForEach(meals) { entry in
                        EntryListItemView(entries: $meals, entry: entry)
//                        .listRowSeparator(.hidden)
//                        .listRowBackground(Color.clear)
                            .padding(.vertical, 8) // manuel Padding
                            .listRowInsets(EdgeInsets()) // deletes te default Insets
                            .background(Color(.systemGroupedBackground))
                            .listRowSeparator(.hidden)
                    }
                }

                Section("Snacks", isExpanded: $isSnacksExpanded) {
                    ForEach(snacks) { entry in
                        EntryListItemView(entries: $snacks, entry: entry)
                            .padding(.vertical, 8)
                            .listRowInsets(EdgeInsets())
                            .background(Color(.systemGroupedBackground))
                            .listRowSeparator(.hidden)
                    }
                }

                Section("Drinks", isExpanded: $isDrinksExpanded) {
                    ForEach(drinks) { entry in
                        EntryListItemView(entries: $drinks, entry: entry)
                            .padding(.vertical, 8)
                            .listRowInsets(EdgeInsets())
                            .background(Color(.systemGroupedBackground))
                            .listRowSeparator(.hidden)
                    }
                }
                
                Section("Deserts", isExpanded: $isDesertsExpanded) {
                    ForEach(deserts) { entry in
                        EntryListItemView2(entries: $deserts, entry: entry)
                            .padding(.vertical, 8)
                            .listRowInsets(EdgeInsets())
                            .background(Color(.systemGroupedBackground))
                            .listRowSeparator(.hidden)

                    }
                    .onDelete { indexSet in
                        deserts.remove(atOffsets: indexSet)
                        print("Updated entries:")
                        deserts.forEach { print("- \($0)") }
                    }
                }
            }
            .listStyle(.sidebar) // only style which is creating foldable lists. And also uppercase the headline.
//            .border(.red)
        }
    }
}

//#Preview {
//    EntryListView()
//}
