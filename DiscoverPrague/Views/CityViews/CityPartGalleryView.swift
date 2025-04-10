//
//  TestGalleryView.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 07.04.2025.
//

import SwiftUI

struct CityPartGalleryView: View {
    let imageNames: [String]
    @State private var selectedImage: GalleryImage? = nil
    
    var body: some View {
        // MARK: Maps out the specific selected images from all available images.
        let galleryImages: [GalleryImage] = imageNames.map { GalleryImage(name: $0) }
        
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(galleryImages) { image in
                        Image(image.name)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300, height: 200)
                            .clipped()
                            .cornerRadius(12)
                            .onTapGesture {
                                selectedImage = image
                            }
                    }
                }
                .padding()
            }
        }
        // MARK: Brings out a full screen view of a selected image
        .fullScreenCover(item: $selectedImage) { image in
            FullscreenImageView(images: galleryImages, selectedImage: image)
        }
    }
}

struct FullscreenImageView: View {
    let images: [GalleryImage]
    let selectedImage: GalleryImage
    @Environment(\.dismiss) private var dismiss
    @State private var currentIndex: Int = 0
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(images.indices, id: \.self) { index in
                ZStack {
                    Image(images[index].name)
                        .resizable()
                        .scaledToFill()
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(images[index].name)
                            .resizable()
                            .scaledToFill()
                    }
                    .buttonBorderShape(.roundedRectangle(radius: 20))
                }
                .tag(index)
            }
        }
        .tabViewStyle(.page)
        .onAppear {
            if let index = images.firstIndex(where: { $0.id == selectedImage.id }) {
                currentIndex = index
            }
        }
    }
}

struct GalleryImage: Identifiable {
    let id = UUID()
    let name: String
}
