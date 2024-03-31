//
//  FeedCollectionReusableView.swift
//  Alajo
//
//  Created by God's on 3/22/24.
//

import UIKit

class FeedCollectionReusableView: UICollectionReusableView {

    @IBOutlet private weak var image: UIImageView!
    @IBOutlet private weak var labelView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        
    }
    
    fileprivate func setupView() {
        image.layer.cornerRadius = 8
        labelView.alpha = 0.8
    }
    
}
