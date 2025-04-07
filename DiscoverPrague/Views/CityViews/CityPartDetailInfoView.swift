//
//  CityPartDetailView.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 07.04.2025.
//

import SwiftUI
import MapKit

struct CityPartDetailInfoView: View {
    let header: String
    let description: String
    let coordinate: CLLocationCoordinate2D
    
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    Text(header)
                        .headerTextStyle()
                        .foregroundStyle(.fill)
                    
                    Text(description)
                        .descriptionTextStyle()
                        .foregroundStyle(.fill)
                }
                
                Map(initialPosition: .region(MKCoordinateRegion(
                    center: coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))) {
                    Marker(header, coordinate: coordinate)
                }
                .clipShape(Circle())
                .frame(maxWidth: 400)
                .disabled(true)
                .padding()
            }
        }
    }
}

#Preview {
    CityPartDetailInfoView(header: "Did you know?", description: "Strossmayerovo square was established back in 1624 as a reaction to some stupid fucking shit that somebody made up.", coordinate: CLLocationCoordinate2D(latitude: 50.1096, longitude: 14.1355))
}
