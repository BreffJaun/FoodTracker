//
//  HydrationBlocksView.swift
//  FoodTracker
//
//  Created by Jeff Braun on 07.08.25.
//

import SwiftUI

struct HydrationBlocksView: View {
    var current: Double
    var goal: Double

    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 6)

    var body: some View {
        LazyVGrid(columns: columns, spacing: 6) {
            ForEach(0..<30) { index in
                let filled = (current / goal) >= Double(index + 1) / 30.0
                Rectangle()
                    .fill(filled ? Color.black : Color.gray.opacity(0.3))
                    .frame(height: 14)
                    .cornerRadius(4)
            }
        }
    }
}


//#Preview {
//    HydrationBlocksView()
//}
