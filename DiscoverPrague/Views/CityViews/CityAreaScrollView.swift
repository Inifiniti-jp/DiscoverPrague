//
//  TestScrollView.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 02.02.2025.
//

import SwiftUI

struct CityAreaScrollView: View {
    @EnvironmentObject var viewModel: CityViewModel
    @Binding var path: NavigationPath
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(viewModel.cityAreas) { location in
                    Button {
                        path.append(location)
                    } label: {
                        ZStack {
                            Image(location.image)
                                .resizable()
                                .foregroundStyle(LinearGradient(
                                    gradient: Gradient(colors: [Color.black.opacity(0.3), Color.clear]),
                                    startPoint: .bottom,
                                    endPoint: .top
                                ))
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
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    CityAreaScrollView(path: .constant(NavigationPath()))
        .environmentObject(CityViewModel())
}
