//
//  ContentView.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 26.01.2025.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State private var isAnimating = false
    @State private var hasAnimated = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("letná")
                    .resizable()
                    .scaledToFill()                .ignoresSafeArea(.all)
                
                VStack {
                    Text("Discover Prague")
                        .headerTextStyle()
                        .scaleEffect(isAnimating ? 1 : 0)
                        .animation(.bouncy(duration: 3), value: isAnimating)
                    
                    CityAreaScrollView()
                        .opacity(isAnimating ? 1 : 0.5)
                        .animation(.easeInOut(duration: 2), value: isAnimating)
                        .padding()
                }
            }
        }
        
        // MARK: Defines the logic so that the animation occurs only once when the view is first rendered, so that it does not repeat every single time the view reappears.
        .onAppear {
            if !hasAnimated {
                isAnimating.toggle()
                hasAnimated = true
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
