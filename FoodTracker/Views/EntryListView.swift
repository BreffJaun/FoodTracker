//
//  EntryListView.swift
//  FoodTracker
//
//  Created by Jeff Braun on 04.08.25.
//

import SwiftUI

struct EntryListView: View {
    
    @Binding var meals: [Entry]
    @Binding var snacks: [Entry]
    @Binding var drinks: [Entry]
    @Binding var deserts: [Entry]
    @State var isMealsExpanded = true
    @State var isSnacksExpanded = true
    @State var isDrinksExpanded = true
    @State var isDesertsExpanded = true
    @State var showDeleteAllAlert = false
    @State var openAddSheet = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                // MARK: Buttons in toolbar packen
//                Button {
//                    showDeleteAllAlert.toggle()
//                } label: {
//                    Text("Delete all")
//                        .padding()
//                        .padding(.horizontal, 8)
//                        .frame(maxWidth: .infinity)
//                        .background(Color.red.opacity(0.8))
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//                .padding()
//                
//                Button {
//                    openAddSheet.toggle()
//                } label: {
//                    Text("Add entry")
//                        .padding()
//                        .padding(.horizontal, 8)
//                        .frame(maxWidth: .infinity)
//                        .background(Color.blue.opacity(0.8))
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//                .padding()
                
                List {
                    Section("Meals", isExpanded: $isMealsExpanded) {
                        ForEach($meals) { entry in
                            EntryListItemView(entries: $meals, entry: entry)
                                .padding(.vertical, 8) // manuel Padding
                                .listRowInsets(EdgeInsets()) // deletes te default Insets
                                .background(Color(.systemGroupedBackground))
                                .listRowSeparator(.hidden)
                        }
                    }
                    
                    Section("Snacks", isExpanded: $isSnacksExpanded) {
                        ForEach($snacks) { entry in
                            EntryListItemView(entries: $snacks, entry: entry)
                                .padding(.vertical, 8)
                                .listRowInsets(EdgeInsets())
                                .background(Color(.systemGroupedBackground))
                                .listRowSeparator(.hidden)
                        }
                    }
                    
                    Section("Drinks", isExpanded: $isDrinksExpanded) {
                        ForEach($drinks) { entry in
                            EntryListItemView(entries: $drinks, entry: entry)
                                .padding(.vertical, 8)
                                .listRowInsets(EdgeInsets())
                                .background(Color(.systemGroupedBackground))
                                .listRowSeparator(.hidden)
                        }
                    }
                    
                    Section("Deserts", isExpanded: $isDrinksExpanded) {
                        ForEach($deserts) { entry in
                            EntryListItemView(entries: $deserts, entry: entry)
                                .padding(.vertical, 8)
                                .listRowInsets(EdgeInsets())
                                .background(Color(.systemGroupedBackground))
                                .listRowSeparator(.hidden)
                        }
                    }
                    
                    // MARK: Test with .onDelete()
                    //                Section("Deserts", isExpanded: $isDesertsExpanded) {
                    //                    ForEach(deserts) { entry in
                    //                        EntryListItemView2(entries: $deserts, entry: entry)
                    //                            .padding(.vertical, 8)
                    //                            .listRowInsets(EdgeInsets())
                    //                            .background(Color(.systemGroupedBackground))
                    //                            .listRowSeparator(.hidden)
                    //
                    //                    }
                    //                    .onDelete { indexSet in
                    //                        deserts.remove(atOffsets: indexSet)
                    //                        print("Updated entries:")
                    //                        deserts.forEach { print("- \($0)") }
                    //                    }
                    //                }
                }
                .listStyle(.sidebar) // only style which is creating foldable lists. And also uppercase the headline.
                //            .border(.red)
                .navigationTitle("Entries")
            }
            .alert("Delete all entries!", isPresented: $showDeleteAllAlert) {
                Button("Delete", role: .destructive) {
                    meals = []
                    snacks = []
                    drinks = []
                    deserts = []
                }
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("Do you really want to delete all entries?")
            }
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showDeleteAllAlert.toggle()
                    } label: {
                        Label("Delete all", systemImage: "trash.circle.fill")
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        openAddSheet.toggle()
                    } label: {
                        Label("Add entry", systemImage: "fork.knife.circle")
                    }
                }
            }
            
            .sheet(isPresented: $openAddSheet) {
                AddEntryView(openAddSheet: $openAddSheet, meals: $meals, snacks: $snacks, drinks: $drinks, deserts: $deserts)
            }
        }
    }
}

//#Preview {
//    EntryListView()
//}
