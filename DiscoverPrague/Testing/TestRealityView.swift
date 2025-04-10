//
//  TestRealityView.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 03.02.2025.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct TestRealityView: View {
    @State private var angle = Angle(radians: 0.0)
    @EnvironmentObject var viewModel: CityViewModel
    
    var body: some View {
        RealityView { content in
            if let modelName = viewModel.selectedModelName {
                if let model = try? await Entity(named: modelName, in: realityKitContentBundle) {
                    model.generateCollisionShapes(recursive: true)
                    model.components.set(InputTargetComponent())
                    content.add(model)
                    model.position = [0, 0, -1]
                    model.transform.rotation = simd_quatf(angle: 0.0, axis: [0, 1, 0])
                    
                }
            }
        }
        .gesture(dragGesture)
        .gesture(rotateGesture)
    }
        
    
    // MARK: Gesture allowing the user to move the entity around the scene
    var dragGesture: some Gesture {
        DragGesture()
            .targetedToAnyEntity()
            .onChanged { value in
                print(value.entity.name)
                value.entity.position = value.convert(value.location3D, from: .local, to: value.entity.parent!)
            }
    }
    
    // MARK: Gesture allowing the user to rotate the entity in all angles
    var rotateGesture: some Gesture {
        RotateGesture3D()
            .targetedToAnyEntity()
            .onEnded { value in
                let finalRotation = value.convert(value.rotation,
                                                  from: .local,
                                                  to: value.entity.parent!) * value.entity.ogRotation!
                value.entity.setOrientation(finalRotation, relativeTo: value.entity.parent!)
                value.entity.ogRotation = nil
            }
            .onChanged { value in
                if value.entity.ogRotation == nil {
                    value.entity.ogRotation = value.entity.orientation(relativeTo: value.entity.parent!)
                }
                let newRotation = value.convert(value.rotation,
                                                from: .local,
                                                to: value.entity.parent!) * value.entity.ogRotation!
                value.entity.setOrientation(newRotation, relativeTo: value.entity.parent!)
            }
    }
}

#Preview {
    TestRealityView()
}

private var ogRotationKey: UInt8 = 0

extension Entity {
    var ogRotation: simd_quatf? {
        get {
            return objc_getAssociatedObject(self, &ogRotationKey) as? simd_quatf
        } set {
            objc_setAssociatedObject(self, &ogRotationKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
