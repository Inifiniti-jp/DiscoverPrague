//
//  HistoryTabView.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 03.02.2025.
//

import SwiftUI

struct HistoryTabView: View {
    @ObservedObject var viewModel = HistoryViewModel()
    let separator: String
    // MARK: Filters the views based on the identified "separator" located in the viewModel
    var filteredHistoryParts: [HistoryParts] {
        viewModel.historyParts.filter { $0.separator == separator }
    }
    
    var body: some View {
        TabView {
            ForEach(filteredHistoryParts, id: \.header) { part in
                ZStack {
                    Image(part.image)
                        .resizable()
                        .scaledToFill()
                    
                    VStack {
                        Text(part.header)
                            .headerTextStyle()
                        
                        Text(part.description)
                            .descriptionTextStyle()
                    }
                }
            }
        }
        .tabViewStyle(.page)
        .ignoresSafeArea(.all)
    }
}
