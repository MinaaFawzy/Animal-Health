//
//  HomeRepository.swift
//  Animal Health App
//
//  Created by OSX on 04/09/2022.
//

import Foundation

protocol HomeRepository {
    
    func getNewsFeed(page: Int, completion: @escaping(Result<ArticlesPost,Error>) -> Void)
    
    func getSearchedNewsFeed(keyword: String, page: Int, completion: @escaping(Result<ArticlesPost,Error>) -> Void )
    
    func getNewsFeedDetails(id: Int, completion: @escaping(Result<ArticleDetails,Error>) -> Void)
}
