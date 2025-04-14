//
//  ModelEntityLoader.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 11.04.2025.
//

import RealityKit
import RealityKitContent

/// Currently not in use!!!!! Had some issues with model loading (conflicts with loading the model from the main thread)

class ModelEntityLoader {
    func loadModel(named name: String) async throws -> Entity {
        let model = try await Entity(named: name, in: realityKitContentBundle)
        await model.generateCollisionShapes(recursive: true)
        await model.components.set(InputTargetComponent())
        return model
    }
}
