//
//  TestScroll.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 03.04.2025.
//

import SwiftUI

struct TestScroll: View {
    @ObservedObject private var viewModel = CityViewModel()
    
    var body: some View {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.cityAreas, id: \.header) {
                        location in
                        NavigationLink(destination: TestCityTabView(separator: location.separator)) {
                            ZStack {
                                Image(location.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 480, height: 300)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .padding()
                                
                                Text(location.header)
                                    .navigationTextStyle()
                            }
                        }
                        .buttonStyle(.plain)
                        .buttonBorderShape(.roundedRectangle(radius: 20))
                        
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }

#Preview {
    TestScroll()
}
