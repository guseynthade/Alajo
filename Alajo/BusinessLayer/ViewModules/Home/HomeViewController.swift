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
        mainCollection.register(UINib(nibName: "HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView")
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
    
    fileprivate func moreAction(type: HeaderType) {
        print(type)
    }

}

extension HomeViewController: UICollectionViewDelegate,
                              UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeCell(cellClass: MovieCollectionViewCell.self, indexPath: indexPath)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 48)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as! HeaderCollectionReusableView
//            reusableview.confHeader(type: indexPath.section == 0 ? .today : indexPath.section == 1 ? .thisWeek : indexPath.section == 2 ? .popular : .topRated)
//            reusableview.moreButton.tag = indexPath.section
//            reusableview.type = indexPath.section == 0 ? .today : indexPath.section == 1 ? .thisWeek : indexPath.section == 2 ? .popular : .topRated)
            reusableview.moreCallBack = { [weak self] type in
                guard let self = self else {return}
                self.moreAction(type: type)
                print(type)
            }
            var headerType: HeaderType
                    
                    switch indexPath.section {
                    case 0:
                        headerType = .today
                    case 1:
                        headerType = .thisWeek
                    case 2:
                        headerType = .popular
                    case 3:
                        headerType = .topRated
                    default:
                        headerType = .today
                    }
//                    
                    reusableview.confHeader()
                return reusableview


        default:  fatalError("Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height * 0.4)
    }
    
}
