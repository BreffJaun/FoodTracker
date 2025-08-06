//
//  DashboardView.swift
//  FoodTracker
//
//  Created by Jeff Braun on 06.08.25.
//

import SwiftUI

struct DashboardView: View {
    @Binding var meals: [Entry]
    @Binding var snacks: [Entry]
    @Binding var drinks: [Entry]
    @Binding var deserts: [Entry]
    
    private var today: Date {
        Calendar.current.startOfDay(for: Date())
    }
    
    private var totalCaloriesToday: Int {
        let entries = meals + snacks + drinks + deserts
        return entries
            .filter { Calendar.current.isDate($0.date, inSameDayAs: today) }
            .reduce(0) { $0 + $1.calories }
    }

    
    var totalMealCalories: Int { meals.reduce(0) { $0 + $1.calories } }
    var totalSnackCalories: Int { snacks.reduce(0) { $0 + $1.calories } }
    var totalDrinkCalories: Int { drinks.reduce(0) { $0 + $1.calories } }
    var totalDesertCalories: Int { deserts.reduce(0) { $0 + $1.calories } }
    
    var grandTotal: Int {
        totalMealCalories + totalSnackCalories + totalDrinkCalories + totalDesertCalories
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("🍽️ Calorie Overview")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 10)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Label("Meals", systemImage: "fork.knife")
                    Spacer()
                    Text("\(totalMealCalories) kcal")
                        .bold()
                }
                
                HStack {
                    Label("Snacks", systemImage: "leaf")
                    Spacer()
                    Text("\(totalSnackCalories) kcal")
                        .bold()
                }
                
                HStack {
                    Label("Drinks", systemImage: "cup.and.saucer")
                    Spacer()
                    Text("\(totalDrinkCalories) kcal")
                        .bold()
                }
                
                HStack {
                    Label("Desserts", systemImage: "birthday.cake")
                    Spacer()
                    Text("\(totalDesertCalories) kcal")
                        .bold()
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            
            Divider().padding(.vertical, 10)
            
            HStack {
                Label("Today’s Total", systemImage: "calendar")
                    .font(.title2)
                    .bold()
                Spacer()
                Text("\(totalCaloriesToday) kcal")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.green)
            }
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(12)

            Divider().padding(.vertical, 10)
            
            HStack {
                Text("Total:")
                    .font(.title2)
                    .bold()
                Spacer()
                Text("\(grandTotal) kcal")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.blue)
            }
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(12)
            
            Spacer()
        }
        .padding()
    }    
}


//#Preview {
//    DashboardView()
//}
