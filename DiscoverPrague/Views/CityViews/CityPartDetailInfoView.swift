//
//  CityPartDetailView.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 07.04.2025.
//

import SwiftUI
import MapKit

struct CityPartDetailInfoView: View {
    @EnvironmentObject var viewModel: CityViewModel
    let city: CityPart
    @State private var isShowing360 = false
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        HStack(alignment: .center ,spacing: 100) {
            CityPartMapView(coordinate: city.coordinate)
            
            VStack {
                Text(city.cityPartDescription)
                    .font(.system(size: 25, weight: .semibold, design: .monospaced))
                    .padding(30)
                    .background(.thinMaterial)
                    .cornerRadius(20)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: 500)
                
                Button {
                    Task {
                        if !isShowing360 {
                            viewModel.selectedCityPartIdentifier = city.cityPart
                            await openImmersiveSpace(id: "360")
                            isShowing360 = true
                        } else {
                            await dismissImmersiveSpace()
                            isShowing360 = false
                        }
                    }
                } label: {
                    Text(isShowing360 ? "Dismiss 360 photo" : "Show 360 photo")
                }
            }
        }
        .padding(.horizontal, 100)
    }
}

