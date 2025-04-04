//
//  TestModel.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 02.02.2025.
//

import Foundation
import SwiftUI

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
    private enum CodingKeys: String, CodingKey {
            case cityPart, cityPartHeader, cityPartDescription, cityPartImage, cityPartModel
        }
    }
