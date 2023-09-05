//
//  MenuBarOptionsView.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 9/5/23.
//

import SwiftUI

struct MenuBarOptionsView: View {
    @Binding var selectedOption: Category
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                
                    ForEach(Category.allCases, id: \.self) { item in
                        VStack {
                        Text(item.rawValue)
                            .foregroundColor(item == selectedOption ? .black : .gray)
                        
                        if selectedOption == item {
                            Capsule()
                                .fill(.black)
                                .frame(height: 3)
                                .padding(.horizontal, -10)
                        } else {
                            Capsule()
                                .fill(.clear)
                                .frame(height: 3)
                                .padding(.horizontal, -10)
                        }
                    }
                        .onTapGesture {
                            self.selectedOption = item
                        }
                }
            }
        }
    }
}

struct MenuBarOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBarOptionsView(selectedOption: .constant(.breakfast))
    }
}
