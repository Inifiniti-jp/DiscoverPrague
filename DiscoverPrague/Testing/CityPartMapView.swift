//
//  CityPartMapView.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 06.04.2025.
//

import SwiftUI
import MapKit

struct CityPartMapView: View {
    @ObservedObject var viewModel = CityViewModel()
    var body: some View {
        Map(initialPosition: .region(MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 50.088218898410375, longitude: 14.402906651305639),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        ))) {
            Marker("Test", systemImage: "mappin.circle.fill", coordinate: CLLocationCoordinate2D(latitude: 50.088218898410375, longitude: 14.402906651305639))
                }
        .clipShape(Circle())
            }
        }


#Preview {
    CityPartMapView()
}
