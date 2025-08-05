//
//  EntryListItemView.swift
//  FoodTracker
//
//  Created by Jeff Braun on 04.08.25.
//

import SwiftUI

struct EntryListItemView2: View {
    
    @Binding var entries: [Entry]
    var entry: Entry
    @State var showEntryDetails: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(entry.title)
                    .font(.headline)
                Spacer()
                Text("\(entry.calories) kcal")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
//            .swipeActions {
//                Button(role: .destructive){
//                    if let i = entries.firstIndex(where: {$0.id == entry.id}) {
//                        entries.remove(at: i)
//                        print("Updated entries:")
//                        entries.forEach { print("- \($0)") }
//                    }
//                } label: {
//                    Label("Delete", systemImage: "trash")
//                }
//            }
            Text(entry.date, style: .date)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

//#Preview {
//    EntryListItemView()
//}
