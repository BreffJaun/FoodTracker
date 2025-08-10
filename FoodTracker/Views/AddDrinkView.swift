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
    
    @State private var showAlert = false
    
    
    var body: some View {
        Form {
            Section("Add new Drink") {
                TextField("Amount in ml", text: $amount)
                    .keyboardType(.numberPad)
                    .onChange(of: amount) {
                        // Filter only digits (0-9)
                        let filtered = amount.filter { $0.isNumber }
                        if filtered != amount {
                            amount = filtered
                        }
                    }
                DatePicker("Date", selection: $date, displayedComponents: [.date])
                Picker("Drink Category", selection: $drinkType) {
                    ForEach(DrinkType.allCases, id: \.rawValue) { drink in
                        Text(drink.rawValue).tag(drink)
                    }
                }
            }
            
            Section {
                Button {
                    if let ml = Double(amount), ml > 0 {
                        let newDrink = Drink(amount: ml, type: drinkType)
                        if let i = drinkEntries.firstIndex(where: {
                            Calendar.current.isDate($0.date, inSameDayAs: date)
                        }) {
                            drinkEntries[i].drinks.append(newDrink)
                        } else {
                            // New drinkDay
                            let newDay = DrinkDay(date: date, goal: 2000, drinks: [newDrink])
                            drinkEntries.append(newDay)
                        }
                        showAddDrinkSheet = false
                    } else {
                        showAlert = true
                    }
                } label: {
                    Text("Save")
                }
            }
        }
        .alert("Invlaid input", isPresented: $showAlert, actions: {
            Button("OK", role: .cancel) { }
        }, message: {
            Text("Please enter a valid quantity in ml.")
        })
    }
}

//#Preview {
//    AddDrinkView()
//}

