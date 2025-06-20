//
//  ArticlesNetworking.swift
//  SpaceNews
//
//  Created by Rana Mustafa on 20/06/2025.
//

import Foundation
enum ArticlesNetworking {
    case getAllAtricles
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
        case .getAllAtricles :
            return "/v4/articles/"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAllAtricles :
            return .get
        }
    }
    
    var task: Task {
        switch self {
            case .getAllAtricles :
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getAllAtricles :
            return .none
        }
        
    }
    
    
}
