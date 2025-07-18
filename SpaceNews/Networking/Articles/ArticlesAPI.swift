//
//  ArticlesAPI.swift
//  SpaceNews
//
//  Created by Rana Mustafa on 21/06/2025.
//

import Foundation
protocol ArticleAPIProtocol {
   
    func getArticles(limit : Int , offset : Int , orderBy : String? , completion: @escaping (Result<ArticleResponse, Error>) -> Void)
    func searchArticles(by query : String, offset: Int ,completion: @escaping (Result<ArticleResponse, Error>) -> Void)
   
}
class ArticlesAPI : BaseAPI<ArticlesNetworking> , ArticleAPIProtocol {
    // MARK: getAllArticles
    func getArticles(limit : Int , offset : Int , orderBy : String? , completion: @escaping (Result<ArticleResponse, Error>) -> Void) {
        self.fetchData(target: .getAllArticles(limit: limit, offset: offset , orderBy: orderBy), responseType: ArticleResponse.self) { (result) in
            completion(result)
        }
    }
    // MARK: searchArticles
    func searchArticles(by query : String, offset: Int,completion: @escaping (Result<ArticleResponse, Error>) -> Void)
    {
        self.fetchData(target: .searchOfArticles(search: query, offset: offset), responseType: ArticleResponse.self ) { (result) in
            completion(result)
        }
    }
    
}
 
