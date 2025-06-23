//
//  ArticlesNetworking.swift
//  SpaceNews
//
//  Created by Rana Mustafa on 20/06/2025.
//

import Foundation
import Alamofire
enum ArticlesNetworking {
    case getAllArticles (limit : Int , offset : Int , orderBy : String?)
    case searchOfArticles (search: String)
 
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
         default :
            return "/v4/articles/"
        
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAllArticles :
            return .get
        case.searchOfArticles :
            return .get
   
        }
    }
    
    var task: Task {
        switch self {
            case .getAllArticles(let limit , let offset , let orderBy) :
            var params : [String: Any] = [
                "limit" : limit,
                "offset" : offset
            ]
            if let orderBy = orderBy {
                params ["ordering"] = orderBy
            }
            return .requestParameterized(parameters: params, encoding: URLEncoding.default)
         
        case .searchOfArticles(let search) :
            return .requestParameterized(parameters: ["search": search], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default :
            return .none
        }
        
    }
    
    
}
