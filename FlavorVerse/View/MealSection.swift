//
//  MealSection.swift
//  FlavorVerse
//
//  Created by Lunick Francois on 9/15/23.
//

import SwiftUI

struct MealSection: View {
    let options: Category
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text(options.rawValue)
                .font(.title.bold())
                .padding(.vertical)
            
            ForEach(options.categories) { mealItem in
                HStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(mealItem.name)
                            .font(.title3.bold())
                        
                        Text(mealItem.description)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Image(mealItem.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 88)
                        .clipped()
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Divider()
                
            }
        }
    }
}

struct MealSection_Previews: PreviewProvider {
    static var previews: some View {
        MealSection(options: .breakfast)
    }
}
