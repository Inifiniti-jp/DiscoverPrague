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
    @EnvironmentObject var viewModel: CityViewModel
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Image("letná")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
                
                VStack {
                    Text("Discover Prague")
                        .headerTextStyle()
                    
                    CityAreaScrollView(path: $path)
                        .padding()
                }
            }
            .navigationDestination(for: CityArea.self) { area in
                CityPartTabView(path: $path, cityArea: area)
            }
            .navigationDestination(for: CityPart.self) { part in
                CityPartDetailView(city: part)
            }
        }
    }
}


#Preview(windowStyle: .automatic) {
    ContentView()
        .environmentObject(CityViewModel())
}
