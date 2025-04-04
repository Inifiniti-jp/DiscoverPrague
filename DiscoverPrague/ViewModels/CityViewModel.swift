//
//  TestCityViewModel.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 03.04.2025.
//

import Foundation

class CityViewModel: ObservableObject {
    @Published var cityAreas: [CityArea] = []

    init() {
        loadTestCityData()
    }

    func loadTestCityData() {
        guard let url = Bundle.main.url(forResource: "CityData", withExtension: "json") else {
            print("❌ TestData.json not found")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([CityArea].self, from: data)
            cityAreas = decoded
            print("✅ Loaded \(decoded.count) city areas")
        } catch {
            print("❌ JSON decode error: \(error)")
        }
    }
}
