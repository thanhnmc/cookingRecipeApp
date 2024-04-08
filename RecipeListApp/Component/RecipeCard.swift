//
//  RecipeCard.swift
//  RecipeListApp
//
//  Created by Nguyen Manh Cong Thanh on 8/4/24.
//

import SwiftUI

struct RecipeCard: View {
    var recipe: Recipe
    
    var body: some View {
        AsyncImage(url: URL(string: recipe.thumb ?? "")) {
            image in
            image
                .aspectRatio(contentMode: .fill)
                .overlay(alignment: .bottom) {
                    VStack {
                        Text(recipe.name ?? "")
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 3, x: 0, y: 0)
                            .frame(maxWidth: 136)
                            .padding()
                        Text(recipe.headline ?? "")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 3, x: 0, y: 0)
                            .frame(maxWidth: 120)
                            .padding(.bottom, 50)
                    }
                }
            }
            placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(width: 180, height: 180, alignment: .top)
            .cornerRadius(20)
    }
}

#Preview {
    RecipeCard(recipe: Recipe(calories: "790 kcal",
                              carbos: "100 g",
                              description: " meatballs to you and me. But meatballs so good you want \r\n\r\nto parade them down the street waving your arms aloft like a passionate Italian grandmother. \r\n\r\nThese little rascals are perfect for your little rascals (both big and small!) as you can get \r\n\r\neveryone involved in rolling them up. Once served, everyone around the table must choose an \r\n\r\nItalian name and act Italian for the rest of dinner time. Andiamo!*",
                              difficulty: 3,
                              fats: "9 g",
                              headline: "with Creamy Parmesan Polenta",
                              id: "53314398ff604d6c7a8b456a",
                              image: "https://img.hellofresh.com/f_auto,q_auto/hellofresh_s3/image/53314398ff604d6c7a8b456a.jpg",
                              name: "Herbed Italian Polpetti",
                              proteins: "39 g",
                              thumb: "https://img.hellofresh.com/f_auto,q_auto,w_300/hellofresh_s3/image/53314398ff604d6c7a8b456a.jpg",
                              time: "PT35M")
    )
}
