//
//  HistoryView.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 01.02.2025.
//

import SwiftUI

struct HistoryView: View {
    @State private var isAnimating = false
    @State private var hasAnimated = false
    var body: some View {
        NavigationStack {
            ZStack {
                Image("prague_history")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .opacity(isAnimating ? 1 : 0.5)
                    .animation(.easeIn(duration: 3), value: isAnimating)
                
                VStack {
                    Text("Prague's history")
                        .multilineTextAlignment(.center)
                        .headerTextStyle()
                        .scaleEffect(isAnimating ? 1 : 0)
                        .animation(.bouncy(duration: 3), value: isAnimating)
                    
                    HistoryPartsScrollView()
                        .offset(y: isAnimating ? 0 : 500)
                        .animation(.easeInOut(duration: 3), value: isAnimating)
                }
            }
            .onAppear {
                if !hasAnimated {
                    isAnimating.toggle()
                    hasAnimated = true
                }
            }
        }
    }
}

#Preview {
    HistoryView()
}
