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
    @ObservedObject private var cityViewModel = CityViewModel()
    @ObservedObject private var historyViewModel = HistoryViewModel()
    
    var body: some SwiftUI.Scene {
        WindowGroup(id: "ContentView") {
            TabView {
                ContentView()
                    .tabItem {
                        Image(systemName: "mappin.and.ellipse")
                        Text("Locations")
                    }
                HistoryView()
                    .tabItem {
                        Image(systemName: "timelapse")
                        Text("History")
                    }
            }
        }
        
        WindowGroup(id: "PhotoGallery") {
            PhotoGalleryView(separator: "")
                .ignoresSafeArea(.all)
        }
        .windowStyle(.plain)
        .defaultWindowPlacement { content, context in
            let size = content.sizeThatFits(.init(width: 600, height: 600))
            let mainWindow = context.windows.first { window in
                window.id == "ContentView"
            }
            if let mainWindow {
                return WindowPlacement(.trailing(mainWindow), size: size)
            }
            return WindowPlacement(size: size)
        }
        
        WindowGroup(id: "VolumeView") {
            Model3D(named: "Prague", bundle: realityKitContentBundle) { model in
                model
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
        }
        .windowStyle(.volumetric)
        
        ImmersiveSpace(id: "ImmersiveSpace") {
            TestRealityView()
        }
    }
}
