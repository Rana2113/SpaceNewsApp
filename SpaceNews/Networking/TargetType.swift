//
//  TargetType.swift
//  SpaceNews
//
//  Created by Rana Mustafa on 20/06/2025.
//

import Foundation
import Alamofire
enum HTTPMethod : String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum Task {
    case requestPlain
    case requestParameterized(parameters : [String : Any] , encoding : ParameterEncoding)
}

protocol TargetType {
    var baseURL: URL { get }
    var path : String { get }
    var method : HTTPMethod { get }
    var task : Task { get }
    var headers : [String : String]? { get }
}
