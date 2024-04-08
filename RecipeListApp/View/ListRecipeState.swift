//
//  ListRecipeState.swift
//  RecipeListApp
//
//  Created by Nguyen Manh Cong Thanh on 8/4/24.
//

import Foundation

class ListRecipeState: ObservableObject {
    @Published var contentState: RecipeState = .initial
}

enum RecipeState {
    case initial
    case loading
    case fetched(_ recipes: [Recipe])
    case noRecipesFound
    case apiError(_ error: Error)
}


