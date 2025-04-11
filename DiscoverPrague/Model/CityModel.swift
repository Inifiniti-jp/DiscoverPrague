//
//  TestModel.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 02.02.2025.
//

import Foundation
import SwiftUI
import MapKit

struct CityArea: Codable, Identifiable, Hashable {
    var id: String { header }
    let header: String
    let image: String
    let cityParts: [CityPart]

    // MARK: Handles separation of different data points in json
    private enum CodingKeys: String, CodingKey {
        case header, image, cityParts
    }
}

struct CityPart: Codable, Identifiable, Hashable {
    var id = UUID()
    let cityPart: String
    let cityPartHeader: String
    let cityPartDescription: String
    let cityPartImage: String
    let cityPartModel: String
    let cityPartLat: Double
    let cityPartLon: Double
    let cityPartGallery: [String]
    let cityPartModels: [String]
    let cityPart360: String
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: cityPartLat, longitude: cityPartLon)
    }
    // MARK: Handles separation of different data points in json
    private enum CodingKeys: String, CodingKey {
        case cityPart, cityPartHeader, cityPartDescription, cityPartImage,
             cityPartModel, cityPartLat, cityPartLon, cityPartGallery,
             cityPartModels, cityPart360
    }
}
