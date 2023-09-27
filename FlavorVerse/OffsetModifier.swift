//
//
//  OffsetModifier.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 9/16/23.
//
//  Description: This file contains the OffsetModifier, a SwiftUI view modifier.
//  The OffsetModifier is used to modify the layout of views by tracking offsets and applying
//  animation based on user interactions in the FlavorVerse app.
//
//  You are welcome to use, modify, and distribute this code under the terms of the MIT license.
//  Please retain this header in all copies of the code.
//
//  Git Repository: https://github.com/FrancoisLunick-FS/FlavorVerse-iOS
//
//  Note: The OffsetModifier is a key component of the FlavorVerse app's user interface.
//


import Foundation
import SwiftUI

/// OffsetModifier is a SwiftUI view modifier that tracks view offsets and applies animations.
struct OffsetModifier: ViewModifier {
    let category: Category
    @Binding var currentCategory: Category
    
    
    /// Modifies the content view with offset tracking and animation.
    /// - Parameter content: The content view to be modified.
    /// - Returns: A modified view.
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
