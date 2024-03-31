//
//  SearchViewModel.swift
//  Alajo
//
//  Created by God's on 3/22/24.
//


import Foundation



final class SearchViewModel {
    var successCallback: (() -> Void)?
    var errorCallback: ((String) -> Void)?
    private var searchList: [SearchResult]?
    
    func getSearchList(text: String) {
        SearchManager.shared.getSearchList(query: text) { [weak self] responseData, errorString in
            guard let self = self else {return}
            
            if let errorString = errorString {
                self.errorCallback?(errorString)
            } else if let responseData = responseData?.results {
                self.searchList = responseData
                self.successCallback?()
            }
        }
    }
}


