//
//  ArticleTableViewCell.swift
//  SpaceNews
//
//  Created by Rana Mustafa on 25/06/2025.
//

import UIKit
//import AlamofireImage
//import SDWebImage
import Kingfisher
class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var articleImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    @IBOutlet weak var sourcelabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        articleImageView.layer.cornerRadius = 10
    }
 
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure (with article: Article) {
        
        articleImageView.loadImage(url :article.urlToImage, placeholder: article.newsSite)
        articleImageView.backgroundColor = .black
        titleLabel.text = article.title
        summaryLabel.text = article.summary.trimmingCharacters(in: .whitespacesAndNewlines)
        sourcelabel.text = article.newsSite
        dateLabel.text = formatDate(article.publisedAt)
    
        
    }
    
    
    
     
}

