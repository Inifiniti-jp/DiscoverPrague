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

struct CityDetailView: View {
    let city: CityPart
    enum DetailSection {
        case home, gallery, models
    }
    @State private var selectedSection: DetailSection = .home
        
    var body: some View {
        ZStack(alignment: .center) {
            Image(city.cityPartImage)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
            
            switch selectedSection {
            case .home:
                CityPartDetailInfoView(header: city.cityPartHeader, description: city.cityPartDescription, coordinate: city.coordinate)
            case .gallery:
                TestGalleryView(imageNames: city.cityPartGallery)
            case .models:
                CityVolumetricView()
            
            }
        }
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
    }
}

