//
//  ArticlesListPresenter.swift
//  PetProject
//
//  Created by Кирилл Колесников on 02.03.2022.
//

import Foundation

protocol ArticlesListPresenterDelegate: AnyObject {
    func setupUI()
}

protocol ArticlesListPresenterProtocol: AnyObject {
    var articles: [Article] { get }
    func configureUI()
}

final class ArticlesListPresenter {
    weak var coordinator: GeneralCoordinator?
    weak var viewDelegate: ArticlesListPresenterDelegate?
    private let articleService: ArticleServiceProtocol
    var articles: [Article] = []
    
    init(articleService: ArticleServiceProtocol) {
        self.articleService = articleService
        getArticles()
    }
    
    func configureUI() {
        viewDelegate?.setupUI()
    }
    
    private func getArticles() {
        self.articles = articleService.fetchArticles()
    }
}

extension ArticlesListPresenter: ArticlesListPresenterProtocol {}

