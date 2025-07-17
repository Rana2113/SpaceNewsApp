//
//  UIImageView.swift
//  SpaceNews
//
//  Created by Rana Mustafa on 15/07/2025.
//

import Foundation
import Kingfisher
import UIKit

extension UIImageView {
    func loadImage( url : String , placeholder: String) {

            let processor = DownsamplingImageProcessor(size: self.bounds.size)
            self.kf.setImage(
                with: URL(string: url),
                placeholder : UIImage(named: placeholder),
                options: [.processor(processor),
                         .scaleFactor(UIScreen.main.scale),
                          .cacheOriginalImage])
    
    }
        }
