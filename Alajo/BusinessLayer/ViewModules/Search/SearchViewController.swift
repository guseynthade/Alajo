//
//  SearchViewController.swift
//  Alajo
//
//  Created by God's on 3/22/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet private weak var searchField: UITextField!
//    {
//        didSet {
//            let placeholder = NSAttributedString(string: "Search",
//                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "brand")!.withAlphaComponent(0.4)])
//            
//            searchField.attributedPlaceholder = placeholder
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        setupView()
//        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
//        view.addGestureRecognizer(tapGesture)
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

extension SearchViewController: UITextFieldDelegate {
//    func textFieldDidChangeSelection(_ textField: UITextField) {
//        guard let text = searchField.text else {return}
//        
//        print(text)
//    }
}
