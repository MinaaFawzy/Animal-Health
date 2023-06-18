//
//  ReposetoriesImpl.swift
//  Animal Health App
//
//  Created by OSX on 04/09/2022.
//

import Foundation
import Moya

class HomeRepositoryImpl: HomeRepository {
    
    
    let catalogProvider = MoyaProvider<HomePage>()
    
    func getNewsFeed(page: Int, completion: @escaping(Result<ArticlesPost,Error>) -> Void) {
        catalogProvider.request(.newsFeed(page: page)) { result in
            Decoder.decode(completion: completion, result: result)
        }
    }
    
    func getSearchedNewsFeed(keyword: String, page: Int, completion: @escaping (Result<ArticlesPost, Error>) -> Void) {
        catalogProvider.request(.newsFeedAfterSearch(keyWord: keyword, page: page)) { result in
            Decoder.decode(completion: completion, result: result)
        }
    }
    
    func getNewsFeedDetails(id: Int, completion: @escaping (Result<ArticleDetails, Error>) -> Void) {
        catalogProvider.request(.newsFeedDetails(id: id)) { result in
            Decoder.decode(completion: completion, result: result)
        }
    }
    
    
}
