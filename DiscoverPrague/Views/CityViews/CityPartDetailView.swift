//
//  CityDetailView.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 31.01.2025.
//

import SwiftUI
import RealityKit
import RealityKitContent
import MapKit

struct CityPartDetailView: View {
    let city: CityPart
    enum DetailSection {
        case home, gallery, models
    }
    @State private var selectedSection: DetailSection = .home
    
    var body: some View {
        ZStack {
            ZStack(alignment: .leading) {
                Map(initialPosition: .region(MKCoordinateRegion(
                    center: city.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.0016, longitudeDelta: 0.0016)))) {
                        Marker(city.cityPartHeader, coordinate: city.coordinate)
                    }
                    .scaledToFill()
                    .mapStyle(.hybrid(pointsOfInterest: .excludingAll))
                    .disabled(true)
                    .ignoresSafeArea(.all)
                
                LinearGradient(
                    gradient: Gradient(colors: [Color.black.opacity(0.3), Color.clear]),
                    startPoint: .bottom,
                    endPoint: .top
                )
                .ignoresSafeArea()
                .toolbar {
                    ToolbarItem(placement: .bottomOrnament) {
                        HStack {
                            Button {
                                selectedSection = .home
                            } label: {
                                Image(systemName: "house")
                            }
                            
                            Button {
                                selectedSection = .gallery
                            } label: {
                                Image(systemName: "photo")
                            }
                            
                            Button {
                                selectedSection = .models
                            } label: {
                                Image(systemName: "cube")
                            }
                        }
                    }
                }
                
                switch selectedSection {
                case .home:
                    CityPartDetailInfoView(header: city.cityPartHeader, description: city.cityPartDescription, coordinate: city.coordinate)
                        .padding()
                case .gallery:
                    TestGalleryView(imageNames: city.cityPartGallery)
                        .padding()
                case .models:
                    CityVolumetricView()
                        .padding()
                }
            }
            .ignoresSafeArea(.all)
        }
    }
}

