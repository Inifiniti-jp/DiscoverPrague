//
//  TestTabView.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 02.02.2025.
//

import SwiftUI

struct CityPartTabView: View {
    @EnvironmentObject var viewModel: CityViewModel
    @Binding var path: NavigationPath
    var cityArea: CityArea
    
    var body: some View {
        TabView {
            ForEach(cityArea.cityParts) { part in
                ZStack {
                    Image(part.cityPartImage)
                        .imageStyle()
                    
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(0.3), Color.clear]),
                        startPoint: .bottom,
                        endPoint: .top)
                    .ignoresSafeArea(.all)
                    
                    VStack {
                        Text(part.cityPartHeader)
                            .headerTextStyle()
                        
                        Text(part.cityPartDescription)
                            .descriptionTextStyle()
                        
                        Button {
                            path.append(part)
                        } label: {
                            Text("Open Details")
                                .padding()
                        }
                    }
                }
            }
        }
        .tabViewStyle(.page)
        .ignoresSafeArea()
    }
}
