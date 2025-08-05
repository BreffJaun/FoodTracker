//
//  AddEntryView.swift
//  FoodTracker
//
//  Created by Jeff Braun on 05.08.25.
//

import SwiftUI

struct AddEntryView: View {
    
    @Binding var openAddSheet: Bool
    @Binding var meals: [Entry]
    @Binding var snacks: [Entry]
    @Binding var drinks: [Entry]
    @Binding var deserts: [Entry]
    
    @State var title: String = ""
    @State var caloriesInput: String = ""
    @State var calories: Int = 0
    @State var entryCategory: EntryType = .deserts
    @State private var mealTime: MealTime = .lunch
    @State private var mood: Mood = .neutral
    @State private var isFavorite: Bool = false
    
    
    var body: some View {
        Form {
            Section(header: Text("New Entry")) {
                TextField("Title", text: $title)
                TextField("Calories", text: $caloriesInput)
                    .keyboardType(.numberPad)
                Picker("Entry Category", selection: $entryCategory) {
                    ForEach(EntryType.allCases, id: \.rawValue) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
            }
            
            Section(header: Text("Additional Info")) {
                Picker("Mealtime", selection: $mealTime) {
                    ForEach(MealTime.allCases) { time in
                        Text(time.rawValue).tag(time)
                    }
                }

                Picker("Mood", selection: $mood) {
                    ForEach(Mood.allCases) { mood in
                        Text(mood.rawValue).tag(mood)
                    }
                }

                Toggle("Favorite", isOn: $isFavorite)
            }
            
            Section {
                Button("Save Entry") {
                    if let cal = Int(caloriesInput) {
                        let newEntry = Entry(
                            title: title,
                            calories: cal,
                            mealTime: mealTime,
                            isFavorite: isFavorite,
                            mood: mood
                        )
                        
                        switch entryCategory {
                            case .meals: meals.append(newEntry)
                            case .snacks: snacks.append(newEntry)
                            case .drinks: drinks.append(newEntry)
                            case .deserts: deserts.append(newEntry)
                        }
                        
                        title = ""
                        caloriesInput = ""
                        mealTime = .lunch
                        mood = .neutral
                        isFavorite = false
                        
                        openAddSheet = false
                        
                    } else {
                        print("Invalid calories input!")
                    }
                }
                Button("Cancel", role: .cancel) {
                    openAddSheet = false
                }
                .foregroundStyle(Color.red)
            }
        }
    }
}

//#Preview {
//    AddEntryView()
//}
