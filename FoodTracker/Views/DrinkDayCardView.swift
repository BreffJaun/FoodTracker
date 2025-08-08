//
//  DrinkDayCardView.swift
//  FoodTracker
//
//  Created by Jeff Braun on 07.08.25.
//

import SwiftUI

struct DrinkDayCardView: View {
    var day: DrinkDay
    var onSelect: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(day.date.formatted(date: .abbreviated, time: .omitted))
                    .font(.headline)
                Spacer()
                Text("\(Int(day.totalDrunk)) ml")
                    .font(.headline)
            }
            
            ProgressView(value: day.totalDrunk, total: day.goal)
                .tint(progressColor)
            
            // Einfach alle Drinks anzeigen
            ForEach(day.drinks, id: \.id) { drink in
                HStack {
                    Text(drink.type.rawValue.capitalized)
                    Spacer()
                    Text("\(Int(drink.amount)) ml")
                }
            }
            
            Button(action: onSelect) {
                Text("View Day")
                    .foregroundColor(.white)
//                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
//                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
    
    private var progressColor: Color {
        let progress = day.totalDrunk / day.goal
        if progress >= 1.0 {
            return .green // Ziel erreicht oder überschritten
        } else if progress < 0.25 {
            return .yellow // Unter 25% des Ziels
        } else {
            return .blue // Standardfarbe
        }
    }

    
}



//#Preview {
//    DrinkDayCardView()
//}
