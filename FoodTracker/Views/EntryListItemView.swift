//
//  EntryListItemView.swift
//  FoodTracker
//
//  Created by Jeff Braun on 04.08.25.
//

import SwiftUI

struct EntryListItemView: View {
    
    @Binding var entries: [Entry]
    @Binding var entry: Entry
    @State var showEntryDetails = false
    
    var body: some View {
        Button() {
            showEntryDetails.toggle()
        } label: {
            VStack(alignment: .leading/*, spacing: 4*/) {
                HStack {
                    Text(entry.title)
                        .font(.headline)
                    Spacer()
                    Text("\(entry.calories) kcal")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Text(entry.date, style: .date)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
            .onTapGesture {
                showEntryDetails.toggle()
            }
        }
        .swipeActions {
            Button(role: .destructive){
                if let i = entries.firstIndex(where: {$0.id == entry.id}) {
                    entries.remove(at: i)
                    print("Updated entries:")
                    entries.forEach { print("- \($0)") }
                }
            } label: {
                Label("Delete", systemImage: "trash")
            }
        }
        .sheet(isPresented: $showEntryDetails) {
            EntryDetailView(entry: $entry, showEntryDetails: $showEntryDetails)
                .presentationDetents([.fraction(0.65), .large])
        }
    }
}

//#Preview {
//    EntryListItemView()
//}
