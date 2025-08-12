//
//  DrinkDetailView.swift
//  FoodTracker
//
//  Created by Jeff Braun on 07.08.25.
//

import SwiftUI

struct DrinkDayDetailView: View {
    
    @Binding var day: DrinkDay
    @Binding var drinkEntries: [DrinkDay]
    
    @State private var drinkToDelete: Drink? = nil
    @State private var showDeleteAlert = false
    
    private var progressColor: Color {
        let progress = day.totalDrunk / day.goal
        if progress >= 1.0 {
            return .green
        } else if progress < 0.25 {
            return .yellow
        } else {
            return .blue
        }
    }

    var body: some View {
        List {
            Section(header: Text("Date")) {
                Text(day.date.formatted(date: .complete, time: .omitted))
            }
            
            Section(header: Text("Goal")) {
                Text("\(Int(day.goal)) ml")
            }

            Section(header: Text("Total Drunk")) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(Int(day.totalDrunk)) ml")
                    
                    if day.goal > 0 {
                        let safeValue = min(max(day.totalDrunk, 0), day.goal)
                        ProgressView(value: safeValue, total: day.goal)
                            .tint(progressColor)
                    } else {
                        Text("No goal set")
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 4)
            }

            Section(header: Text("Drinks")) {
                ForEach(day.drinks) { drink in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(drink.type.rawValue.capitalized)
                        }
                        Spacer()
                        Text("\(Int(drink.amount)) ml")
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            drinkToDelete = drink
                            showDeleteAlert = true
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
        }
        .navigationTitle("Day Details")
        .alert("Delete Drink?", isPresented: $showDeleteAlert, presenting: drinkToDelete) { drink in
            Button("Delete", role: .destructive) {
                if let dayIndex = drinkEntries.firstIndex(where: { $0.id == day.id }) {
                    if let drinkIndex = drinkEntries[dayIndex].drinks.firstIndex(where: { $0.id == drink.id }) {
                        drinkEntries[dayIndex].drinks.remove(at: drinkIndex)
                    }
                }
            }

            Button("Cancel", role: .cancel) {}
        } message: { drink in
            Text("Do you really want to delete this drink on day \(day.date.formatted(date: .abbreviated, time: .omitted))?")
        }
    }
}



//#Preview {
//    DrinkDayDetailView()
//}
