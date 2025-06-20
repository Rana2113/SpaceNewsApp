//
//  ArticleResponse.swift
//  SpaceNews
//
//  Created by Rana Mustafa on 20/06/2025.
//

import Foundation
struct ArticleResponse: Codable {
    let count : Int
    let results : [Article]
}
struct Article : Codable  {
    let id : Int
    let title : String
    let authors : authors
    let url : String
    let urlToImage : String
    let newsSite : String
    let summary : String
    let puplisedAt : Date
    
    enum CodingKeys : String , CodingKey {
        case id
        case title
        case authors
        case url
        case urlToImage = "image_url"
        case newsSite = "news_site"
        case summary
        case puplisedAt = "published_at"
    }
    struct authors : Codable {
        let name : String
    }
}
