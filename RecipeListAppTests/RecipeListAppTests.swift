//
//  RecipeListAppTests.swift
//  RecipeListAppTests
//
//  Created by Nguyen Manh Cong Thanh on 8/4/24.
//

import XCTest
@testable import RecipeListApp

final class RecipeListAppTests: XCTestCase {
    
    private var intent: ListRecipeIntent!
    private let service = MockNetworkService()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let state = ListRecipeState()
        intent = ListRecipeIntent(model: state, service: service)
    }
    
    func testFetchListSuccess() {
        service.error = nil
        intent.fetchList()
    }
    
    func testFetchListError() {
        service.error = URLError(.badURL)
        intent.fetchList()
    }
    
}

class MockNetworkService: NetworkServiceProtocol {
    var recipes: [Recipe] = []
    var error: Error?
    
    func fetchRecipes() async throws -> [RecipeListApp.Recipe] {
        if let error = error {
            throw error
        }
        return recipes
    }
}
