//
//  ArticleDetailsViewController.swift
//  SpaceNews
//
//  Created by Rana Mustafa on 09/07/2025.
//

import UIKit

class ArticleDetailsViewController: UIViewController {
    var article : Article?
    
    @IBOutlet weak var articleImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var sourceLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        articleImageView.layer.cornerRadius = 10
        guard let article = article else {return}
        articleImageView.loadImage(url: article.urlToImage, placeholder: article.newsSite)
        titleLabel.text = article.title
        sourceLabel.text = article.newsSite
        dateLabel.text = formatDate(article.publisedAt)
        summaryLabel.text = ("\(article.summary.removesuffix()) ...")
        print("========> title\(titleLabel.text)")
        print(article)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.hidesBarsOnSwipe = false
    }

    

    @IBAction func readFullArticle(_ sender: UIButton) {
        
        guard let urlString = article?.url , let url = URL(string: urlString) else {return}
        UIApplication.shared.open(url)
    }
     
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
