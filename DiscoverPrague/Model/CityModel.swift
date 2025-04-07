//
//  TestModel.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 02.02.2025.
//

import Foundation
import SwiftUI
import MapKit

struct CityArea: Codable, Identifiable {
    var id = UUID()
    let separator: String
    let header: String
    let image: String
    let cityParts: [CityPart]
    private enum CodingKeys: String, CodingKey {
            case separator, header, image, cityParts
        }
    }

struct CityPart: Codable, Identifiable {
    var id = UUID()
    let cityPart: String
    let cityPartHeader: String
    let cityPartDescription: String
    let cityPartImage: String
    let cityPartModel: String
    let cityPartLat: Double
    let cityPartLon: Double
    let cityPartGallery: [String]
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: cityPartLat, longitude: cityPartLon)
    }
    
    private enum CodingKeys: String, CodingKey {
            case cityPart, cityPartHeader, cityPartDescription, cityPartImage, cityPartModel, cityPartLat, cityPartLon, cityPartGallery
        }
    }
