//
//  CityPartMapView.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 06.04.2025.
//

import SwiftUI
import MapKit

struct CityPartMapView: View {
    @State private var scene: MKLookAroundScene?
    @State private var map = false
    let coordinate: CLLocationCoordinate2D
    
    var body: some View {
        ZStack {
            // MARK: Renders an interactive 3D map 
            if scene != nil {
                LookAroundPreview(scene: $scene)
                    .lookAroundViewer(isPresented: $map, initialScene: scene)
                    .clipShape(Circle())
                    .frame(maxWidth: 400)
            } else {
                ProgressView("Loading Look Around...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .task {
            let request = MKLookAroundSceneRequest(coordinate: coordinate)
            scene = try? await request.scene
        }
    }
}

#Preview {
    CityPartMapView(coordinate: CLLocationCoordinate2D(latitude: 50.1096, longitude: 14.1))
}
