//
//  EntryListView.swift
//  FoodTracker
//
//  Created by Romina Reiber on 04.08.25.
//

import SwiftUI

struct EntryListView2: View {
    
    @State var entries: [Entry2] = [
        Entry2(id: "5567a", titel: "Mittagessen", date: Date(), calories: 520),
        Entry2(id: "6743b", titel: "Proteinriegel", date: Date(), calories: 35),
        Entry2(id: "7468c", titel: "Getränke", date: Date(), calories: 130),
        Entry2(id: "454d", titel: "Abendessen", date: Date(), calories: 720)
    ]
    
    @State var showAlert: Bool = false
    @State var entryToDelete: Entry2? = nil
   
    
    var body: some View {
        VStack {
            List {
                Section("Mahlzeiten") {
                    ForEach(entries) { entry in
                        Text(entry.titel)
                            .swipeActions {
                                Button(role: .destructive){
                                    if let auswahl = entries.firstIndex(where: {$0.id == entry.id}) {
                                        entries.remove(at: auswahl) }
                                }label: {
                                    Label("Löschen", systemImage: "trash")
                                }
                            }
                    }
                }
            }
            
            Button {
                
            } label: {
                Text("Alles löschen")
                    .padding()
                    .padding(.horizontal, 8)
                    .frame(maxWidth: .infinity)
                    .background(Color.red.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .alert("alles löschen?", isPresented: $showAlert) {
            Button("Alles löschen", role: .destructive) {
                entries = []
            }
            Button("Abbrechen!", role: .cancel) {}
        } message: {
            Text("Willst du wirklich alles löschen?")
        }
    }
}


#Preview {
    EntryListView2()
}
