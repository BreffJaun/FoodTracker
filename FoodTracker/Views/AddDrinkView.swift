//
//  AddDrinkView.swift
//  FoodTracker
//
//  Created by Jeff Braun on 08.08.25.
//

import SwiftUI

struct AddDrinkView: View {
    
    @Binding var showAddDrinkSheet: Bool
    @Binding var drinkEntries: [DrinkDay]
    
    @State private var amount: String = ""
    @State private var date: Date = Date()
    @State private var drinkType: DrinkType = .water
    
    
    var body: some View {
        Form {
            Section("Add new Drink") {
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
                DatePicker("Date", selection: $date, displayedComponents: [.date])
                Picker("Drink Category", selection: $drinkType) {
                    ForEach(DrinkType.allCases, id: \.rawValue) { drink in
                        Text(drink.rawValue).tag(drink)
                    }
                }
            }
            
            Section {
                Button {
                    showAddDrinkSheet.toggle()
                } label: {
                    Text("Save")
                }
            }
            
//
//            Section(header: Text("Additional Info")) {
//                Picker("Mealtime", selection: $mealTime) {
//                    ForEach(MealTime.allCases) { time in
//                        Text(time.rawValue).tag(time)
//                    }
//                }
//
//                Picker("Mood", selection: $mood) {
//                    ForEach(Mood.allCases) { mood in
//                        Text(mood.rawValue).tag(mood)
//                    }
//                }
//
//                Toggle("Favorite", isOn: $isFavorite)
//            }
//            
//            Section {
//                Button("Save Entry") {
//                    if let cal = Int(caloriesInput) {
//                        let newEntry = Entry(
//                            title: title,
//                            date: date,
//                            calories: cal,
//                            mealTime: mealTime,
//                            isFavorite: isFavorite,
//                            mood: mood
//                        )
//                        
//                        switch entryCategory {
//                            case .meals: meals.append(newEntry)
//                            case .snacks: snacks.append(newEntry)
//                            case .drinks: drinks.append(newEntry)
//                            case .deserts: deserts.append(newEntry)
//                        }
//                        
//                        title = ""
//                        caloriesInput = ""
//                        mealTime = .lunch
//                        mood = .neutral
//                        isFavorite = false
//                        
//                        openAddSheet = false
//                        
//                    } else {
//                        print("Invalid calories input!")
//                    }
//                }
//                Button("Cancel", role: .cancel) {
//                    openAddSheet = false
//                }
//                .foregroundStyle(Color.red)
//            }
        }
    }
}

//#Preview {
//    AddDrinkView()
//}

