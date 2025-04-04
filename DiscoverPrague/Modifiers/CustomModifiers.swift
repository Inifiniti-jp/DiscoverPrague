//
//  CustomModifiers.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 31.01.2025.
//
import Foundation
import SwiftUI

struct HeaderTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 100, weight: .heavy, design: .monospaced))
            .padding(10)
            .shadow(radius: 10)
            .multilineTextAlignment(.center)
    }
}

extension View {
    func headerTextStyle() -> some View {
        self.modifier(HeaderTextModifier())
    }
}

struct DescriptionTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 50, weight: .bold, design: .monospaced))
            .padding(10)
            .shadow(radius: 20)
            .multilineTextAlignment(.center)
    }
}

extension View {
    func descriptionTextStyle() -> some View {
        self.modifier(DescriptionTextModifier())
    }
}

struct NavigationLinkTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 35, weight: .bold, design: .monospaced))
            .foregroundStyle(.white)
            .shadow(radius: 10)
            .multilineTextAlignment(.center)
    }
}

extension View {
    func navigationTextStyle() -> some View {
        self.modifier(NavigationLinkTextModifier())
    }
}


