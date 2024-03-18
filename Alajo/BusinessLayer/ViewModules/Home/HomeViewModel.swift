//
//  HomeViewModel.swift
//  Alajo
//
//  Created by God's on 3/5/24.
//

import Foundation

protocol HomeProtocol: AnyObject {
    func success()
    func error(errorMessage: String)
}

final class HomeViewModel {
    
    private var popularList: PopularMovieModel?
    private var todayList: TodayMovieModel?
    private var weekList: ThisWeekMovieModel?
    private var ratedList: TopRatedMovieModel?
    var successCallback: (() -> Void)?
    var errorCallback: ((String) -> Void)?
    
    var headerType: HeaderType = .today
    
    func setHeader(index: Int) -> HeaderType {
        switch index {
        case 0:
            getTodayMovieList()
            headerType = .today
        case 1:
            getThisWeekMovieList()
            headerType = .thisWeek
        case 2:
            getPopularMovieList()
            headerType = .popular
        case 3:
            getTopRatedMovieList()
            headerType = .topRated
        default:
            headerType = .today
            
        }
        return headerType
    }
    // MARK: Network
    
    func getPopularMovieList() {
        MovieManager.shared.getPopularMovieList(pageID: 1) { [weak self] responseData, errorString in
            guard let self = self else {return}
            
            if let errorString = errorString {
                self.errorCallback?(errorString)
            } else if let responseData = responseData {
                self.popularList = responseData
                self.successCallback?()
            }
        }
    }
    
    func getTodayMovieList() {
        MovieManager.shared.getTodayMovieList(pageID: 1) { [weak self] responseData, errorString in
            guard let self = self else {return}
            
            if let errorString = errorString {
                self.errorCallback?(errorString)
            } else if let responseData = responseData {
                self.todayList = responseData
                self.successCallback?()
            }
        }
    }
    
    func getThisWeekMovieList() {
        MovieManager.shared.getThisWeekMovieList(pageID: 1) { [weak self] responseData, errorString in
            guard let self = self else {return}
            
            if let errorString = errorString {
                self.errorCallback?(errorString)
            } else if let responseData = responseData {
                self.weekList = responseData
                self.successCallback?()
            }
        }
    }
    
    func getTopRatedMovieList() {
        MovieManager.shared.getTopRatedMovieList(pageID: 1) { [weak self] responseData, errorString in
            guard let self = self else {return}
            
            if let errorString = errorString {
                self.errorCallback?(errorString)
            } else if let responseData = responseData {
                self.ratedList = responseData
                self.successCallback?()
            }
        }
    }
}
