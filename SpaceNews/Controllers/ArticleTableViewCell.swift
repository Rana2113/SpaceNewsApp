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
        if let imageUrl = URL(string: article.urlToImage ) {
            let processor = DownsamplingImageProcessor(size: articleImageView.bounds.size)
            articleImageView.kf.setImage(with: imageUrl , options: [.processor(processor), .scaleFactor(UIScreen.main.scale), .cacheOriginalImage])
        }
//        articleImageView.sd_setImage(with: URL(string: article.urlToImage,))
//        if let imageUrl = URL(string: article.urlToImage )
//        {
//            articleImageView.af.setImage(withURL: imageUrl,
//            runImageTransitionIfCached: false)
//            
//        }
        articleImageView.backgroundColor = .black
        titleLabel.text = article.title
        summaryLabel.text = article.summary.trimmingCharacters(in: .whitespacesAndNewlines)
        sourcelabel.text = article.newsSite
        dateLabel.text = formatDate(article.publisedAt)
    
        
    }
    
    
    
    private func formatDate(_ date: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d, MM yyyy"
        let isoFormatter = ISO8601DateFormatter()
        if let parsedDate = isoFormatter.date(from: date) {
            return formatter.string(from: parsedDate)
        } else {
            return "N/A"
        }
    }
}
