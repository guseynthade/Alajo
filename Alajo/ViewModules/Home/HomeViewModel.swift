//
//  HomeViewModel.swift
//  Alajo
//
//  Created by God's on 3/5/24.
//

import Foundation

final class HomeViewModel {
    
    private var popularList: PopularMovieModel?
    var successCallback: (() -> Void)?
    var errorCallback: ((String) -> Void)?
    
    
    // MARK: Network
    
    func getPopularMovieList() {
        MovieManager.shared.getPopularMovieList(pageID: 2) { [weak self] responseData, errorString in
            guard let self = self else {return}
            
            if let errorString = errorString {
                self.errorCallback?(errorString)
            } else if let responseData = responseData {
                self.popularList = responseData
                self.successCallback?()
            }
        }
    }
}
