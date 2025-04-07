//
//  CityToolbarView.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 04.04.2025.
//

import SwiftUI

struct CityToolbarView: View {
    @ObservedObject var viewModel = CityViewModel()
    
    var body: some View {
        Button {
            //
        } label: {
            Image(systemName: "cube")
        }
    }
}

#Preview {
    CityToolbarView()
}
