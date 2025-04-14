//
//  CityPartDetailInfoViewModel.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 11.04.2025.
//

import Foundation

class CityPartDetailInfoViewModel: ObservableObject {
    @Published var isShowing360: Bool = false
    let cityPart: CityPart
    
    init(cityPart: CityPart) {
        self.cityPart = cityPart
    }
    
    func toggle360(openImmersiveSpace: @escaping () async -> Void,
                   dismissImmersiveSpace: @escaping () async -> Void) {
        Task {
            if !isShowing360 {
                await openImmersiveSpace()
                isShowing360 = true
            } else {
                await dismissImmersiveSpace()
                isShowing360 = false
            }
        }
    }
}
