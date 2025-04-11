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
    // MARK: Ensures the correct 360 photo is displayed based on its name in CityData
    var selectedCityPart360: String {
        cityAreas
            .flatMap { $0.cityParts }
            .first(where: { $0.cityPart == selectedCityPartIdentifier })?
            .cityPart360 ?? "360"
    }
    // MARK: Ensures the correct 3D model is taken from the array defined in CityData
    var selectedCityPartModels: [String] {
        cityAreas
            .flatMap { $0.cityParts }
            .first(where: { $0.cityPart == selectedCityPartIdentifier })?
            .cityPartModels ?? []
    }
    // MARK: Ensures only the selected model with a specific string is displayed (models are of [String] type)
    var selectedModelIsValid: Bool {
        selectedCityPartModels.contains { $0 == selectedModelName }
    }
}
