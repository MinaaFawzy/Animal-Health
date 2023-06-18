//
//  NewsFeed.swift
//  Animal Health App
//
//  Created by OSX on 04/09/2022.
//

import Foundation

struct ArticlesPost: Codable {
    let articlesPosts: [NewsFeed]?
    let totalPages: Int
    let currentPage: Int
}

// MARK: - ArticlesPost
struct NewsFeed: Codable {
    let  id: Int?
    let authorName: String?
    let category: String?
    let publishDate: String?
    let editDate: String?
    let isPublished: Bool?
    let text: String?
    let image: String?
}

struct ArticleDetails: Codable{
    let adminCreationId: String?
    let adminEditedByID: String?
    let articleId: Int?
    let authorName: String?
    let body: String?
    let category: String?
    let editDate: String?
    let heading: String?
    let image: String?
    let isPublished: Bool?
    let publishDate: String?
    let reference: [String]?
    let specialization: String?
    let title: String?
}
