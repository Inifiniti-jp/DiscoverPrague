//
//  CityPartModelListViewModel.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 11.04.2025.
//

import Foundation

/// Currently not in use due to some issues with loading the models from background memory, will rework later.

class CityPartModelListViewModel: ObservableObject {
    @Published var isModelOpen: Bool = false
    
    func toggleModelLoading(model: String,
                            cityPart: String,
                            openImmersiveSpace: @escaping (String) async -> Void,
                            dismissImmersiveSpace: @escaping () async -> Void,
                            setSelection: @escaping (String, String) -> Void) {
        
        Task {
            if !isModelOpen {
                setSelection(cityPart, model)
                await openImmersiveSpace("ImmersiveSpace")
                    isModelOpen = true
            } else {
                await dismissImmersiveSpace()
                    isModelOpen = false
            }
        }
    }
}
