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
    let coordinate: CLLocationCoordinate2D
    @State private var map = false
    
    var body: some View {
        ZStack {
            if scene != nil {
                LookAroundPreview(scene: $scene)
                    .lookAroundViewer(isPresented: $map, initialScene: scene)
                    .clipShape(Circle())
                    .frame(maxWidth: 500)

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
