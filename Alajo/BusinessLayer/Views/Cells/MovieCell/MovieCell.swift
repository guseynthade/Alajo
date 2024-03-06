//
//  MovieCell.swift
//  Alajo
//
//  Created by God's on 3/6/24.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    @IBOutlet private weak var movieImg: UIImageView!
    @IBOutlet private weak var movieName: UILabel!
    @IBOutlet private weak var movieDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
