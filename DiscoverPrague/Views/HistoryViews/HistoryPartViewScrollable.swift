//
//  HistoryPartViewScrollable.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 01.02.2025.
//

import SwiftUI

struct HistoryPartsScrollView: View {
    @ObservedObject var viewModel = HistoryViewModel()
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(viewModel.historicalMoments, id: \.self) { moment in
                    NavigationLink(destination: CityPartTabView(separator: moment.computedSeparator)) {
                        ZStack {
                            Image(moment.locationImage)
                                .resizable()
                                .scaledToFill()
                                .clipped()
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .frame(width: 400, height: 250)
                                .shadow(radius: 10)
                            
                            Text(moment.locationHeader)
                                .navigationTextStyle()
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    HistoryPartsScrollView()
}
