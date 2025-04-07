//
//  TestTabView.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 02.02.2025.
//

import SwiftUI

struct CityPartTabView: View {
    @StateObject private var viewModel = CityViewModel()
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    var separator: String
    var filteredCityParts: [CityPart] {
        viewModel.cityAreas.first(where: { $0.separator == separator })?.cityParts ?? []
    }
    
    var body: some View {
        NavigationStack {
            TabView {
                ForEach(filteredCityParts) { part in
                    ZStack {
                        Image(part.cityPartImage)
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                        
                        HStack {
                            VStack {
                                Text(part.cityPartHeader)
                                    .headerTextStyle()
                                
                                Text(part.cityPartDescription)
                                    .descriptionTextStyle()
                                
                                NavigationLink(destination: CityDetailView(city: part)) {
                                    Text("Open Details")
                                }
                                .padding()
                            }
                        }
                    }
                }
            }
            .tabViewStyle(.page)
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    CityPartTabView(separator: "letná")
}
