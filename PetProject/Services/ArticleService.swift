//
//  ArticleService.swift
//  PetProject
//
//  Created by Кирилл Колесников on 07.03.2022.
//

import Foundation
import UIKit

protocol ArticleServiceProtocol {
    func fetchArticles() -> [Article]
}

final class ArticleService {
    private var articles: [Article] = [
        Article(image: UIImage(named: "picture"), text: Consts.articleMockText),
        Article(image: UIImage(named: "picture"), text: Consts.articleMockText),
        Article(image: UIImage(named: "picture"), text: Consts.articleMockText),
        Article(image: UIImage(named: "picture"), text: Consts.articleMockText),
        Article(image: UIImage(named: "picture"), text: Consts.articleMockText),
        Article(image: UIImage(named: "picture"), text: Consts.articleMockText),
        Article(image: UIImage(named: "picture"), text: Consts.articleMockText),
        Article(image: UIImage(named: "picture"), text: Consts.articleMockText),
        Article(image: UIImage(named: "picture"), text: Consts.articleMockText),
        Article(image: UIImage(named: "picture"), text: Consts.articleMockText)
    ]
    
    init() {}
    
    func fetchArticles() -> [Article] {
        return articles
    }
}

extension ArticleService: ArticleServiceProtocol {}
