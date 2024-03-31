//
//  SearchViewController.swift
//  Alajo
//
//  Created by God's on 3/22/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet private weak var searchCollection: UICollectionView!
    @IBOutlet private weak var searchField: UITextField! {
    didSet {
        let placeholder = NSAttributedString(string: "Search",
                                                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "brand")!.withAlphaComponent(0.4)])
        
        searchField.attributedPlaceholder = placeholder
    }
}
    
    private var viewModel = SearchViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
        
        searchCollection.registerNib(with: "SearchCollectionViewCell")
    }
    
    @objc func handleTap(){
        view.endEditing(true)
    }
    
    fileprivate func setupView() {
        searchField.layer.cornerRadius = 8
        searchField.layer.borderWidth = 1
        searchField.layer.borderColor = UIColor(named: "brand")?.cgColor
    }
}


extension SearchViewController: UICollectionViewDelegate,
                                UICollectionViewDataSource,
                                UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeCell(cellClass: SearchCollectionViewCell.self, indexPath: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width * 0.5, height: collectionView.frame.height)
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = searchField.text else {return}
        viewModel.getSearchList(text: text)
        print(text)
    }
}
