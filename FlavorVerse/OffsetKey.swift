//
//  OffsetKey.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 9/15/23.
//
//  Description: This file contains the OffsetKey, which is used as a preference key in SwiftUI.
//  The OffsetKey is used to track and store offset values within views for layout purposes.
//
//  You are welcome to use, modify, and distribute this code under the terms of the MIT license.
//  Please retain this header in all copies of the code.
//
//  Note: The OffsetKey is part of the FlavorVerse app's user interface layout.
//


import SwiftUI

/// Custom preference key to track and store offset values
struct OffsetKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    // Combine function to reduce multiple offset values into a single value
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
