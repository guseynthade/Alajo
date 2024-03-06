//
//  HomeViewController.swift
//  Alajo
//
//  Created by God's on 3/5/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var mainCollection: UICollectionView!
    
    private let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getPopularMovieList()
        setupView()
    }
    
    fileprivate func setupView() {
        confViewModel()
        mainCollection.delegate = self
        mainCollection.dataSource = self
        
        mainCollection.registerNib(with: "MovieCollectionViewCell")
    }
    
    fileprivate func confViewModel() {
        viewModel.successCallback = { [weak self] in
            guard let self = self else {return}
            print("success")
        }
        
        viewModel.errorCallback = { [weak self] errorString in
            guard let self = self else {return}
            print(errorString)
        }
    }

}

extension HomeViewController: UICollectionViewDelegate,
                              UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeCell(cellClass: MovieCollectionViewCell.self, indexPath: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height * 0.4)
    }
    
}
