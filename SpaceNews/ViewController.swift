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
        AF.request("https://api.spaceflightnewsapi.net/v4/articles/")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseString
        { response in
            switch response.result {
            case .success:
                print("Validation Successful")
                print(response.result)
            case let .failure(error):
                print(error)
            }
          
        }
    }
 

}

