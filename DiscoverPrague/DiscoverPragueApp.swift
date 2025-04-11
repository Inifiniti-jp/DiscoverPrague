//
//  DiscoverPragueApp.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 26.01.2025.
//

import SwiftUI
import RealityKit
import RealityKitContent

@main
struct DiscoverPragueApp: App {
    @StateObject var viewModel = CityViewModel()
    @State private var currentImmersionStyle: ImmersionStyle = .full
    
    var body: some SwiftUI.Scene {
        WindowGroup(id: "ContentView") {
                ContentView()
            }
            .environmentObject(viewModel)
        
        ImmersiveSpace(id: "360") {
            CityPartImmersive360()
        }
        .immersionStyle(selection: $currentImmersionStyle, in: .full)
        .environmentObject(viewModel)
        
        ImmersiveSpace(id: "ImmersiveSpace") {
            CityPartModelView()
        }
        .environmentObject(viewModel)
    }
}
