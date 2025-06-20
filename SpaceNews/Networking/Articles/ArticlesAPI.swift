//
//  ArticlesAPI.swift
//  SpaceNews
//
//  Created by Rana Mustafa on 21/06/2025.
//

import Foundation
protocol ArticleAPIProtocol {
   
    func getArticles(completion: @escaping (Result<ArticleResponse, Error>) -> Void)
}
class ArticlesAPI : BaseAPI<ArticlesNetworking> , ArticleAPIProtocol {
    // Mark:- Requests
    func getArticles(completion: @escaping (Result<ArticleResponse, Error>) -> Void) {
        self.fetchData(target: .getAllArticles, responseType: ArticleResponse.self) { (result) in
            completion(result)
           
          
        }
    }
    
}
 
