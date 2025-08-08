//
//  DrinkDetailView.swift
//  FoodTracker
//
//  Created by Jeff Braun on 07.08.25.
//

import SwiftUI

//struct DrinkDayDetailView: View {
//    var day: DrinkDay
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 16) {
//            Text(day.date.formatted(date: .long, time: .omitted))
//                .font(.largeTitle)
//                .bold()
//            
//            Text("Goal: \(Int(day.goal)) ml")
//                .font(.title3)
//            
//            Text("Total drunk: \(Int(day.totalDrunk)) ml")
//                .font(.title3)
//            
//            Divider()
//            
//            Text("Drinks")
//                .font(.headline)
//            
//            List(day.drinks) { drink in
//                HStack {
//                    Text(drink.type.rawValue.capitalized)
//                    Spacer()
//                    Text("\(drink.amount, specifier: "%.1f") ml")
//                }
//            }
//        }
//        .padding()
//        .navigationTitle("Day Details")
//    }
//}

struct DrinkDayDetailView: View {
    var day: DrinkDay

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
                    ProgressView(value: day.totalDrunk, total: day.goal)
                        .tint(progressColor)
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
                }
            }
        }
        .navigationTitle("Day Details")
    }
}



//#Preview {
//    DrinkDayDetailView()
//}
