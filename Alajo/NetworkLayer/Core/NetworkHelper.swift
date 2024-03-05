//
//  NetworkHelper.swift
//  URLSessionProject
//
//  Created by Fagan Aslanli on 30.01.24.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum ErrorTypes: String, Error {
    case authError = "Auth Error"
    case generalError = "General"
    case unknownError = "Unknown Error"
    case invalidData = "Invalid Data"
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    private let baseURL = "https://api.themoviedb.org/3/"
    let header = [
        "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZGMxZGI2NDBkYTE0ZjA5OTAzZmM5NzlkYmNjYmU3ZSIsInN1YiI6IjY1ZGNhMmE0MDNiZjg0MDE2MWFlZGE3YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ZOO3t3M_nH-awAjBucsK5VhYzTF0WiAN2PPtKN7tDHI"

    ]
    
    func requestURL(url: String) -> String {
        baseURL + url
    }
}
