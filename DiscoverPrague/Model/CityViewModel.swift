//
//  TestCityViewModel.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 03.04.2025.
//

import Foundation

class CityViewModel: ObservableObject {
    @Published var cityAreas: [CityArea] = []
    @Published var selectedCityPartIdentifier: String?
    @Published var selectedModelName: String?
    
    init() {
        loadTestCityData()
    }
    
    func loadTestCityData() {
        guard let url = Bundle.main.url(forResource: "CityData", withExtension: "json") else {
            print("❌ CityData.json not found")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([CityArea].self, from: data)
            cityAreas = decoded
        } catch {
            print("❌ JSON decode error: \(error)")
        }
    }
    
    var selectedCityPart360: String {
        cityAreas
            .flatMap { $0.cityParts }
            .first(where: { $0.cityPart == selectedCityPartIdentifier })?
            .cityPart360 ?? "360"
    }
    var selectedCityPartModels: [String] {
        cityAreas
            .flatMap { $0.cityParts }
            .first(where: { $0.cityPart == selectedCityPartIdentifier })?
            .cityPartModels ?? []
    }
    var selectedModelIsValid: Bool {
        selectedCityPartModels.contains { $0 == selectedModelName }
    }
}
