//
//  CityPartDetailViewModel.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 11.04.2025.
//

import Foundation
import MapKit

class CityPartDetailViewModel: ObservableObject {
    enum DetailSection {
        case home, gallery, models
    }
    
    @Published var selectedSection: DetailSection = .home
    
    let city: CityPart
    init(city: CityPart) {
        self.city = city
    }
}
