//
//  CityVolumetricView.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 04.04.2025.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct CityVolumetricView: View {
    @State private var isAnimating = false
    let models = ["BenchVolumetric", "ColumnVolumetric"]
    
    var body: some View {
        HStack(spacing: 100) {
            ForEach(models, id: \.self) { model in
                Button {
                    //
                } label: {
                    Model3D(named: model, bundle: realityKitContentBundle)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

#Preview {
    CityVolumetricView()
}
