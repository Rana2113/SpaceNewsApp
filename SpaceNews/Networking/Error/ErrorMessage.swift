//
//  ErrorMessage.swift
//  SpaceNews
//
//  Created by Rana Mustafa on 21/06/2025.
//

import Foundation
struct ErrorMessage {
    static let genericError = "Something went wrong please try again later"
}
extension Int {
    var errorMessage: String {
        switch self {
        case 401:
            return "unauthorized"
        case 404:
            return "Resource not found"
        case 500:
            return "server error, please try again later"
        default:
            return ErrorMessage.genericError
        }
    }
}
