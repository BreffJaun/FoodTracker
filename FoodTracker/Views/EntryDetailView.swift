//
//  EntryDetailView.swift
//  FoodTracker
//
//  Created by Jeff Braun on 05.08.25.
//

import SwiftUI

struct EntryDetailView: View {
    
    @Binding var entry: Entry
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                Text("Entry Details")
                    .font(.title)
                    .bold()
                    .padding(.top)
                
                // Info Card
                VStack(alignment: .leading, spacing: 16) {
                    detailRow(label: "Title", systemImage: "pencil", value: entry.title)
                    detailRow(label: "Calories", systemImage: "flame", value: "\(entry.calories) kcal", secondary: true)
                    detailRow(label: "Date", systemImage: "calendar", value: entry.date.formatted(date: .long, time: .omitted), secondary: true)
                    detailRow(label: "Meal Time", systemImage: "clock", value: entry.mealTime.rawValue)
                    detailRow(label: "Mood", systemImage: "face.smiling", value: entry.mood.rawValue)
                    
                    HStack {
                        Label("Favorite", systemImage: entry.isFavorite ? "star.fill" : "star")
                            .font(.headline)
                        Spacer()
                        Text(entry.isFavorite ? "Yes" : "No")
                            .font(.body)
                            .foregroundColor(entry.isFavorite ? .yellow : .secondary)
                    }
                    
                    if !entry.description.isEmpty {
                        Divider()
                        Text("Description")
                            .font(.headline)
                        Text(entry.description)
                            .font(.body)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
                .shadow(radius: 2)
                .padding(.horizontal)
                
                // MARK: With Sheet
//                Spacer()
//                
//                Button(action: {
//                    showEntryDetails.toggle()
//                }) {
//                    Text("Close")
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.red.opacity(0.9))
//                        .foregroundColor(.white)
//                        .cornerRadius(12)
//                }
//                .padding(.horizontal)
//                .padding(.bottom)
            }
        }
    }
    
    private func detailRow(label: String, systemImage: String, value: String, secondary: Bool = false) -> some View {
        HStack {
            Label(label, systemImage: systemImage)
                .font(.headline)
            Spacer()
            Text(value)
                .font(.body)
                .foregroundColor(secondary ? .secondary : .primary)
        }
    }
}


//#Preview {
//    EntryDetailView()
//}
