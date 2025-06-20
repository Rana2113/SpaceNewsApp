//
//  ArticlesNetworking.swift
//  SpaceNews
//
//  Created by Rana Mustafa on 20/06/2025.
//

import Foundation
enum ArticlesNetworking {
    case getAllArticles
}
extension ArticlesNetworking : TargetType {
    var baseURL: URL {
        switch self {
        default :
            return Api.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .getAllArticles :
            return "/v4/articles/"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAllArticles :
            return .get
        }
    }
    
    var task: Task {
        switch self {
            case .getAllArticles :
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getAllArticles :
            return .none
        }
        
    }
    
    
}
