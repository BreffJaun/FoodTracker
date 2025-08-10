//
//  DrinkDayListView.swift
//  FoodTracker
//
//  Created by Jeff Braun on 07.08.25.
//

import SwiftUI

struct HydrationDashboardView: View {
    
    @Binding var drinkEntries: [DrinkDay]
    @State private var path = NavigationPath()
    
    @State private var dayToDelete: DrinkDay? = nil
    @State private var showDeleteAlert = false
    
    @State var showAddDrinkSheet: Bool = false
    
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach($drinkEntries) { $day in
                    DrinkDayCardView(drinkEntries: $drinkEntries, day: $day) {
                        path.append(day)
                    }
                    .listRowInsets(EdgeInsets())
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(UIColor.systemBackground))
                            .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 2)
                    )
                    .listRowSeparator(.hidden)
                    .swipeActions {
                        Button(role: .destructive) {
                            dayToDelete = day
                            showDeleteAlert = true
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Hydration Dashboard")
//            .navigationDestination(for: DrinkDay.self) { day in
//                DrinkDayDetailView(day: day, drinkEntries: $drinkEntries)
//            }
            .navigationDestination(for: DrinkDay.self) { day in
                if let i = drinkEntries.firstIndex(where: { $0.id == day.id }) {
                    DrinkDayDetailView(day: $drinkEntries[i], drinkEntries: $drinkEntries)
                }
            }

            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddDrinkSheet.toggle()
                    } label: {
                        Label("Add Drink", systemImage: "drop.circle")
                    }
                }
            }
            .alert("Delete Day?", isPresented: $showDeleteAlert, presenting: dayToDelete) { day in
                Button("Delete", role: .destructive) {
                    if let i = drinkEntries.firstIndex(where: { $0.id == day.id }) {
                        drinkEntries.remove(at: i)
                    }
                }
                Button("Cancel", role: .cancel) {}
            } message: { day in
                Text("Do you really want to delete the day on \(day.date.formatted(date: .abbreviated, time: .omitted))?")
            }
            .sheet(isPresented: $showAddDrinkSheet) {
                AddDrinkView(showAddDrinkSheet: $showAddDrinkSheet, drinkEntries: $drinkEntries)
            }
        }
    }
}



//#Preview {
//    DrinkDayListView()
//}
