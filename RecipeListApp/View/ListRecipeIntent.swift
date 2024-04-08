//
//  ListRecipeIntent.swift
//  RecipeListApp
//
//  Created by Nguyen Manh Cong Thanh on 8/4/24.
//

import Foundation

class ListRecipeIntent {
    private var model: ListRecipeState
    private let service: NetworkServiceProtocol
    
    init(model: ListRecipeState, service: NetworkServiceProtocol) {
        self.model = model
        self.service = service
    }
}

extension ListRecipeIntent: RecipeListIntentProtocol {
    func fetchList() {
        model.contentState = .loading
        Task {
            do {
                let recipes = try await service.fetchRecipes()
                if recipes.count == 0 {
                    model.contentState = .noRecipesFound
                }
                model.contentState = .fetched(recipes)
            } catch {
                model.contentState = .apiError(error)
            }
        }
    }
}

protocol RecipeListIntentProtocol {
    func fetchList()
}

