//
//  MovieCollectionViewCell.swift
//  Alajo
//
//  Created by God's on 3/6/24.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var movieCollection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()

    }
    
    fileprivate func setupView() {
        movieCollection.dataSource = self
        movieCollection.delegate = self
        

        movieCollection.registerNib(with: "MovieCell")
    }

}

extension MovieCollectionViewCell: UICollectionViewDelegate,
                                   UICollectionViewDataSource,
                                   UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeCell(cellClass: MovieCell.self, indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width * 0.368, height: collectionView.frame.height)
    }
    
    
}
