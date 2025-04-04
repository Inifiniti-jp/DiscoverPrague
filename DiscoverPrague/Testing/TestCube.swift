//
//  TestCube.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 02.04.2025.
//
import SwiftUI
import RealityKit
import RealityKitContent

struct TestCube: View {
    @State private var selectedColor: Color = .red

    var body: some View {
        VStack {
            ColorPicker("Pick Cube Color", selection: $selectedColor)
                .padding()
            
            CubeView(color: selectedColor)
        }
    }
}

struct CubeView: View {
    var color: Color

    var body: some View {
        RealityView { content in
            let box = ModelEntity(
                mesh: .generateBox(size: 0.1),
                materials: [UnlitMaterial(color: UIColor(color))]
            )
            box.generateCollisionShapes(recursive: true)
            content.add(box)
        }
    }
}

#Preview {
    TestCube()
}
