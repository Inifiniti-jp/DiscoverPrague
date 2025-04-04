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
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("letná")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Discover Prague")
                        .headerTextStyle()
                        .scaleEffect(isAnimating ? 1 : 0)
                        .animation(.bouncy(duration: 3), value: isAnimating)
                    
                    CityAreaScrollView()
                        .offset(y: isAnimating ? 0 : 500)
                        .animation(.easeInOut(duration: 3), value: isAnimating)
                        .padding()
                }
            }
            .toolbar {
                Button {
                    //
                } label: {
                    Image(systemName: "magnifyingglass")
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
