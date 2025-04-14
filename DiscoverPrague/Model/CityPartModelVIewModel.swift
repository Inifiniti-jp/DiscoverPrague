//
//  CityPartModelVIewModel.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 11.04.2025.
//

import Foundation
import RealityKit
import RealityKitContent

class CityPartModelVIewModel: ObservableObject {
    @Published var modelEntity: Entity?
    private let loader = ModelEntityLoader()
    
    @MainActor
    func loadModel(named name: String) async {
        do {
            let model = try await ModelEntityLoader().loadModel(named: name)
                self.modelEntity = model
        } catch {
            print("error loading entity")
        }
    }
}
