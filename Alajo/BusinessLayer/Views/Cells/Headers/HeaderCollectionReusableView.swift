//
//  HeaderCollectionReusableView.swift
//  Alajo
//
//  Created by God's on 3/6/24.
//

import UIKit

enum HeaderType: String {
    case today = "Today"
    case thisWeek = "This Week"
    case popular = "Popular"
    case topRated = "Top Rated"
}

class HeaderCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet private weak var titleMovie: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    @IBAction func moreAction(_ sender: UIButton) {
        moreCallBack?(type)
        print(type)
        
//        switch sender.tag {
//        case 0:
//            print("today")
//        case 1:
//            print("this week")
//        case 2:
//            print("popular")
//        case 3:
//            print("top rated")
//        default:
//            break
//        }
//        print(#function)
    }
    
    
    var type: HeaderType = .today
    
    var moreCallBack: ((HeaderType) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func confHeader() {
        titleMovie.text = type.rawValue
        
        switch type {
        case .today:
            print("today")
        case .thisWeek:
            print("this week")
        case .popular:
            print("popular")
        case .topRated:
            print("top rated")
        }
    }
    
}
