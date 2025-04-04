//
//  HistoryModel.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 03.02.2025.
//

import Foundation

struct HistoricalMoments: Identifiable, Hashable {
    let id = UUID()
    let locationHeader: String
    let locationImage: String
}

// MARK: Extension filtering which data should be displayed when the user clicks on any historical moment
extension HistoricalMoments {
    var computedSeparator: String {
        switch locationHeader {
        case "MALÁ STRANA":
            return "maláStrana"
        case "HOLEŠOVICE":
            return "holešovice"
        default:
            return ""
        }
    }
}

struct HistoryParts: Identifiable, Hashable {
    var id = UUID()
    let separator: String
    let header: String
    let description: String
    let image: String
}
