//
//  EnlargedPhotoView.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 01.02.2025.
//

import SwiftUI

struct EnlargedPhotoView: View {
    let selectedImage: String
    
    var body: some View {
                Image(selectedImage)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
            }
        }
