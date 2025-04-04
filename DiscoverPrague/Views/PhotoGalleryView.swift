//
//  PhotoGalleryView.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 01.02.2025.
//

import SwiftUI

struct PhotoGalleryView: View {
    @StateObject private var viewModel = CityViewModel()
    var photos = ["letná", "maláStrana"]
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    var separator: String
    var filteredCityParts: [CityPart] {
        viewModel.cityAreas.first(where: { $0.separator == separator })?.cityParts ?? []
    }
    
    var body: some View {
        NavigationStack {
            Text("Photo gallery")
                .font(.largeTitle)
                .padding()
            
                        
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(filteredCityParts) { part in
                        NavigationLink(destination: EnlargedPhotoView(selectedImage: "\(part)")) {
                            Image(part.cityPartImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
        }
    }
}
//#Preview {
//    PhotoGalleryView()
//}
