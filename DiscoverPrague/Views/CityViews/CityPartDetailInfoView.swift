//
//  CityPartDetailView.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 07.04.2025.
//

import SwiftUI
import MapKit

struct CityPartDetailInfoView: View {
    let header: String
    let description: String
    let coordinate: CLLocationCoordinate2D
    let icons = ["location.fill", "hammer.fill", ]
    
    var body: some View {
        HStack(spacing: 100) {
            Text(description)
                .font(.system(size: 25, weight: .semibold, design: .monospaced))
                .padding(30)
                .background(.thinMaterial)
                .cornerRadius(20)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: 500)
            
            CityPartMapView(coordinate: coordinate)
        }
        .padding(50)
    }
}

#Preview {
    CityPartDetailInfoView(header: "Did you know?", description: "Letná is a vibrant hilltop district known for its expansive park, iconic Metronome, and some of the best panoramic views over Prague’s historic center. It blends laid-back green spaces, skate culture, and beer garden chill with deep historical roots — once home to the world’s largest Stalin monument. Today, it’s a local favorite for sunset walks, weekend hangs, and creative energy.", coordinate: CLLocationCoordinate2D(latitude: 50.1096, longitude: 14.1355))
}
