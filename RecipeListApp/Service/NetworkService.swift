//
//  NetworkService.swift
//  RecipeListApp
//
//  Created by Nguyen Manh Cong Thanh on 8/4/24.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func fetchRecipes() async throws -> [Recipe]
}

final class NetworkService: NetworkServiceProtocol {
    static let shared = NetworkService()
    
    private init() {}
    
    func fetchRecipes() async throws -> [Recipe] {
        let url = "https://hf-android-app.s3-eu-west-1.amazonaws.com/android-test/recipes.json"
        guard let url = URL(string: url) else {
            throw URLError(.badURL)
        }
        
        do {
            let (data, _) = try await withCheckedThrowingContinuation { continuation in
                AF.request(url, method: .get).responseData { response in
                    switch response.result {
                    case .success(let data):
                        continuation.resume(returning: (data, response.response))
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
            }
            return try JSONDecoder().decode([Recipe].self, from: data)
        } catch {
            throw error
        }
    }
}
