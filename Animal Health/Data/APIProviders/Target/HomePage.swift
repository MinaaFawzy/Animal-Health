
//  GetData.swift
//  Animal Health
//
//  Created by OSX on 04/09/2022.


import Foundation
import Moya

enum HomePage {
    case newsFeed(page: Int)
    case newsFeedAfterSearch(keyWord: String, page: Int)
    case newsFeedDetails(id: Int)
}

extension HomePage : TargetType{
    var baseURL: URL {
        URL(string: "http://andrew100-001-site1.etempurl.com/api")!
    }
    
    var path: String {
        switch self {
        case .newsFeed:
             return "HomePage/DisplayPageposts"
        case .newsFeedAfterSearch:
            return "Search/Search"
        case .newsFeedDetails:
            return "HomePage/DisplayArticleDetails"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .newsFeed, .newsFeedDetails, .newsFeedAfterSearch:
            return .get
        }
    
    }
    
    var task: Task {
        switch self {
        case let .newsFeed( page):
            return .requestParameters(parameters: ["xPage" : page], encoding: URLEncoding.queryString)
        case let .newsFeedAfterSearch(keyWord,page):
            return .requestParameters(parameters: ["KeyWord": keyWord, "xPage": page], encoding: URLEncoding.queryString)
        case let .newsFeedDetails(id):
            return .requestParameters(parameters: ["id" : id], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        [:]
    }
    
    
}

