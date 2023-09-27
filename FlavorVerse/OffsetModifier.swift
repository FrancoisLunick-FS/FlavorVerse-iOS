//
//  OffsetModifier.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 9/16/23.
//

import Foundation
import SwiftUI

struct OffsetModifier: ViewModifier {
    let category: Category
    @Binding var currentCategory: Category
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geometryProxy in
                    Color.red
                        .preference(key: OffsetKey.self, value: geometryProxy.frame(in: .named("scroll")))
                }
            )
            .onPreferenceChange(OffsetKey.self) { proxy in
                let offset = proxy.minY
                withAnimation {
                    currentCategory = (offset < 20 && -offset < (proxy.midX / 2) && currentCategory != category) ? category : currentCategory
                }
            }
    }
}
