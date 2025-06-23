//
//  BaseAPI.swift
//  SpaceNews
//
//  Created by Rana Mustafa on 20/06/2025.
//

import Foundation
import Alamofire
class BaseAPI <T: TargetType>  {
    
    func fetchData<M : Decodable>(target : T , responseType: M.Type,completion: @escaping (Result<M, Error>) -> Void) {
        let baseURL = target.baseURL.appendingPathComponent(target.path)
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let params = buildParameters(task: target.task)
        AF.request(baseURL , method: method , parameters: params.0 , encoding: params.1 , headers: headers)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseDecodable(of:  M.self) { response in
                switch response.result {
                case .success(let decodedData):
                    completion(.success(decodedData))
                case.failure(let error) :
                    if let statusCode = response.response?.statusCode {
                        let message = statusCode.errorMessage
                        let customError = NSError(domain: baseURL.absoluteString, code: statusCode, userInfo: [NSLocalizedDescriptionKey : message])
                        completion(.failure(customError))
                    } else
                    {
                        completion(.failure(error))
                    }
                }
            }
    }
    
    
    private func buildParameters (task : Task) -> ([String: Any], ParameterEncoding ){
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestParameterized(let parameters, let encoding):
            return (parameters , encoding)
        }
    }
}
