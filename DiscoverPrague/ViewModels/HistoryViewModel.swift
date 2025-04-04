//
//  HistoryViewModel.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 03.02.2025.
//

import Foundation

class HistoryViewModel: ObservableObject {
    @Published var historicalMoments: [HistoricalMoments] = []
    @Published var historyParts: [HistoryParts] = []
    //@Published var models: [Models] = []
    
    init() {
        addData()
    }
    
    func addData() {
        historicalMoments = historicalMomentsData
        historyParts = historyPartsData
    }
    
    let historicalMomentsData = [
        HistoricalMoments(locationHeader: "MALÁ STRANA", locationImage: "malá_strana"),
        HistoricalMoments(locationHeader: "HOLEŠOVICE", locationImage: "holešovice")
    ]
    
    let historyPartsData = [
        HistoryParts(separator: "maláStrana", header: "MALÁ STRANA", description: "A historic and picturesque area with Baroque architecture and charming narrow streets.", image: "kampa"),
        HistoryParts(separator: "maláStrana", header: "FRANZ KAFKA MUSEUM", description: "A museum dedicated to the life and work of the famous Czech writer Franz Kafka.", image: "franz_kafka_museum"),
        HistoryParts(separator: "holešovice", header: "HOLEŠOVICE", description: "A trendy, evolving district blending art, industry, and modern cafés.", image: "holešovice"),
        HistoryParts(separator: "holešovice", header: "TROJA BRIDGE", description: "A bridge connecting Troja to Holešovice", image: "troja_bridge")
    ]
}

