//
//  CityVolumetricView.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 04.04.2025.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct CityPartModelListView: View {
    @EnvironmentObject var viewModel: CityViewModel
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    @State private var isModelOpen = false
    let city: CityPart
    
    var body: some View {
        HStack {
            ForEach(city.cityPartModels, id: \.self) { model in
                Button {
                    Task {
                        if !isModelOpen {
                            viewModel.selectedCityPartIdentifier = city.cityPart
                            viewModel.selectedModelName = model
                            await openImmersiveSpace(id: "ImmersiveSpace")
                            isModelOpen = true
                        } else {
                            await dismissImmersiveSpace()
                            isModelOpen = false
                        }
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 400, height: 400)
                            .foregroundStyle(.clear)
                            .background(.thinMaterial)
                            .cornerRadius(20)
                        
                        Image(systemName: "view.3d")
                            .resizable()
                            .scaledToFit()
                            .padding()
                    }
                    .frame(width: 400)
                }
                .buttonStyle(.plain)
                .buttonBorderShape(.roundedRectangle(radius: 20))
            }
        }
    }
}
