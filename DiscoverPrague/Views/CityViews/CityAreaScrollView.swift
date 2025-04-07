//
//  TestScrollView.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 02.02.2025.
//

import SwiftUI

struct CityAreaScrollView: View {
    
    @ObservedObject private var viewModel = CityViewModel()
    
    var body: some View {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.cityAreas, id: \.header) {
                        location in
                        NavigationLink(destination: TestCityPartTabView(separator: location.separator)) {
                            ZStack {
                                Image(location.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 400, height: 300)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .padding()
                                
                                Text(location.header)
                                    .navigationTextStyle()
                            }
                        }
                        .buttonStyle(.plain)
                        .buttonBorderShape(.roundedRectangle(radius: 20))
                        .shadow(radius: 10)
                        
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }

#Preview {
    CityAreaScrollView()
}
