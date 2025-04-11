//
//  Test360.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 09.04.2025.
//

import SwiftUI
import RealityKit
import RealityKitContent

// MARK: A function handling the photo entity, wraps it as a texture inside a sphere and inverts the normals
func createImmersivePicture(imageName : String) -> Entity {
    let modelEntity = Entity()
    let texture = try? TextureResource.load(named: imageName)
    var material = UnlitMaterial()
    material.color = .init(texture: .init(texture!))
    modelEntity.components.set(ModelComponent(mesh: .generateSphere(radius: 1E3), materials: [material]))
    modelEntity.scale = .init(x: -10, y: 10, z: 10)
    modelEntity.transform.translation += SIMD3<Float>(0.0, 1.0, 0.0)
    return modelEntity
}

struct CityPartImmersive360: View {
    @EnvironmentObject var viewModel: CityViewModel
    
    var body: some View {
        let imageName = viewModel.selectedCityPart360
        RealityView { content in
            content.add(createImmersivePicture(imageName: imageName))
        }
    }
}
