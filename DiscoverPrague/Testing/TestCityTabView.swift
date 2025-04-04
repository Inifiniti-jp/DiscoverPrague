//
//  TestCityTabView.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 03.04.2025.
//

import SwiftUI

struct TestCityTabView: View {
    @StateObject private var viewModel = CityViewModel()
    var separator: String
    @State private var isAnimating = false

    var filteredCityParts: [CityPart] {
        viewModel.cityAreas.first(where: { $0.separator == separator })?.cityParts ?? []
    }

    var body: some View {
        TabView {
            ForEach(filteredCityParts) { part in
                ZStack {
                    Image(part.cityPartImage)
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()

                    VStack {
                        Text(part.cityPartHeader)
                            .headerTextStyle()
                            .scaleEffect(isAnimating ? 1 : 0)
                            .animation(.easeInOut(duration: 2), value: isAnimating)

                        Text(part.cityPartDescription)
                            .descriptionTextStyle()
                            .multilineTextAlignment(.center)
                            .padding()
                            .offset(y: isAnimating ? 0 : 300)
                            .animation(.easeInOut(duration: 2), value: isAnimating)
                    }
                    .padding()
                }
            }
        }
        .tabViewStyle(.page)
        .ignoresSafeArea(.all)
        .onAppear {
            isAnimating = true
        }
    }
}

#Preview {
    TestCityTabView(separator: "letná")
}
