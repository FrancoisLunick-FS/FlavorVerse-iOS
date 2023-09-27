//
//  OffsetKey.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 9/15/23.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
