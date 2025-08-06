//
//  TabView.swift
//  FoodTracker
//
//  Created by Jeff Braun on 06.08.25.
//

import SwiftUI

struct TabView: View {
    
    @State var entries = entriesList
    
    var body: some View {
        TabView {
            Tab("Calories", systemImage: "fork.knife.circle") {
                DashboardView(entries: $entries)
            }
            
            Tab("Entries", systemImage: "entry.lever.keypad") {
                EntryListView(entries: $entries)
            }
        }
    }
}

#Preview {
    TabView()
}
