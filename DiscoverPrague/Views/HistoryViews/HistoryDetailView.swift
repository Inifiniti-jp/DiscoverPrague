//
//  HistoryDetailView.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 01.02.2025.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct HistoryDetailView: View {
    let history: HistoryParts
    
    @State private var isGalleryOpen = false
    @State private var isModelOpen = false
    @State private var isAnimating = false
    @State private var hasAnimated = false
    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow
    
    var body: some View {
        ZStack {
            Image(history.image)
                .resizable()
                .ignoresSafeArea(.all)
            
            VStack {
                VStack {
                    Text(history.header)
                        .headerTextStyle()
                        .scaleEffect(isAnimating ? 1 : 0)
                        .animation(.easeInOut(duration: 2), value: isAnimating)
                    
                    Text(history.description)
                        .descriptionTextStyle()
                        .offset(y: isAnimating ? 0 : 300)
                        .animation(.easeInOut(duration: 2), value: isAnimating)
                }
            }
            .onAppear {
                if !hasAnimated {
                    isAnimating.toggle()
                    hasAnimated = true
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .bottomOrnament) {
                HStack {
                    Button {
                        Task {
                            if isGalleryOpen == false {
                                openWindow(id: "PhotoGallery")
                                isGalleryOpen = true
                            } else {
                                dismissWindow(id: "PhotoGallery")
                                isGalleryOpen = false
                            }
                        }
                    } label: {
                        Image(systemName: "photo.circle")
                    }
                    Button {
                        Task {
                            if isModelOpen == false {
                                openWindow(id: "VolumeView")
                                isModelOpen = true
                            } else {
                                dismissWindow(id: "VolumeView")
                                isModelOpen = false
                            }
                        }
                    } label: {
                        Image(systemName: "cube")
                    }
                }
            }
        }
    }
}
