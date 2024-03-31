//
//  SearchCollectionViewCell.swift
//  Alajo
//
//  Created by God's on 3/26/24.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var movieImg: UIImageView!
    @IBOutlet private weak var movieName: UILabel!
    @IBOutlet private weak var movieDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    fileprivate func setupView() {
        movieImg.layer.cornerRadius = 8
    }
    
//    func confCell(model: MovieCellProtocol) {
//        movieImg.loadURL(model.imgTitle)
//        movieName.text = model.nameTitle
//        movieDate.text = model.dateTitle
//    }

}
