//
//  ViewController.swift
//  SpaceNews
//
//  Created by Rana Mustafa on 19/06/2025.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let api: ArticleAPIProtocol =  ArticlesAPI()
        api.getArticles { (result) in
            switch result {
            case .success(let response ):
                print(response.count)
                let articles = response.results
                for article in articles {
                    print("title -> \(article.title) \n")
                   
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
        
        
        
//        AF.request("https://api.spaceflightnewsapi.net/v4/articles/")
//            .validate(statusCode: 200..<300)
//            .validate(contentType: ["application/json"])
//            .responseString
//        { response in
//            switch response.result {
//            case .success:
//                print("Validation Successful")
//                print(response.result)
//            case let .failure(error):
//                print(error)
//            }
//          
//        }
    }
 

}

