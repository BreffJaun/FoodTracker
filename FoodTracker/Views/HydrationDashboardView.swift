//
//  DrinkDayListView.swift
//  FoodTracker
//
//  Created by Jeff Braun on 07.08.25.
//

import SwiftUI

//struct DrinkDayListView: View {
//    
//    @State var path: NavigationPath = NavigationPath()
//    @State private var drinkEntries = drinkDays
//    
//    var body: some View {
//        NavigationStack(path: $path) {
//            List {
//                ForEach(drinkEntries) { day in
//                    VStack(alignment: .leading, spacing: 8) {
//                        Text(day.date.formatted(date: .abbreviated, time: .omitted))
//                            .font(.headline)
//                        
//                        ProgressView(value: day.totalDrunk, total: day.goal) {
//                            Text("Total: \(Int(day.totalDrunk)) ml / \(Int(day.goal)) ml")
//                        }
//                        .accentColor(day.totalDrunk >= day.goal ? .green : .blue)
//                        
//                        ForEach(day.drinks, id: \.id) { drink in
//                            HStack {
//                                Text(drink.type.rawValue)
//                                Spacer()
//                                Text("\(Int(drink.amount)) ml")
//                                    .foregroundColor(.secondary)
//                            }
//                            .font(.subheadline)
//                        }
//                        Spacer()
//                        Button(action: {
//                            path.append(day)
//                        }, label: {
//                            HStack {
//                                Spacer()
//                                Image(systemName: "calendar.day.timeline.left")
//                                    .font(.headline)
//                                    .foregroundColor(.white)
//                                Spacer()
//                            }
//                            .padding(.vertical, 10)
//                            .background(Color.blue)
//                            .cornerRadius(12)
//                            .shadow(radius: 2)
//                        })
//                        .padding(.top, 8)
//                    }
//                    .padding(.vertical, 8)
//                }
//            }
//            .navigationDestination(for: DrinkDay.self) { day in
//                DrinkDayDetailView(day: day)
//            }
//            .navigationTitle("Hydration Days")
//        }
//    }
//}

import SwiftUI

struct HydrationDashboardView: View {
    
    @State private var path = NavigationPath()
    @State private var drinkEntries = drinkDays
    @State var showAddDrinkSheet: Bool = false
    

    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(drinkEntries) { day in
                        DrinkDayCardView(day: day) {
                            path.append(day)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Hydration Dashboard")
            .navigationDestination(for: DrinkDay.self) { day in
                DrinkDayDetailView(day: day)
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
        }
        .sheet(isPresented: $showAddDrinkSheet) {
            AddDrinkView(showAddDrinkSheet: $showAddDrinkSheet, drinkEntries: $drinkEntries)
        }
    }
}


//#Preview {
//    DrinkDayListView()
//}
