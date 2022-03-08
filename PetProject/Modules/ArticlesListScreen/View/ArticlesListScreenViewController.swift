//
//  ArticlesListScreenViewController.swift
//  PetProject
//
//  Created by Кирилл Колесников on 02.03.2022.
//

import UIKit

final class ArticlesListScreenViewController: UIViewController {
    private var presenter: ArticlesListPresenterProtocol?
    
    private lazy var articlesLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.text = "Статьи"
        label.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        return label
    }()
    
    private lazy var table: UITableView = {
        let table = UITableView(frame: .zero)
        table.register(ArticleTableViewCell.self, forCellReuseIdentifier: ArticleTableViewCell.reuseIdentifier)
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.dataSource = self
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.configureUI()
    }
    
    func inject(with presenter: ArticlesListPresenterProtocol) {
        self.presenter = presenter
    }
}

private extension ArticlesListScreenViewController {
    func configureLabel() {
        view.addSubview(articlesLabel)
        
        articlesLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
    
    func configureTableView() {
        view.addSubview(table)
        
        table.snp.makeConstraints {
            $0.top.equalTo(articlesLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(50)
        }
    }
}

extension ArticlesListScreenViewController: ArticlesListPresenterDelegate {
    func setupUI() {
        view.backgroundColor = .white
        configureLabel()
        configureTableView()
    }
}

extension ArticlesListScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.articles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.reuseIdentifier, for: indexPath) as? ArticleTableViewCell else { return UITableViewCell() }
        
        let article = Article(image: UIImage(named: "picture"), text: Consts.articleMockText)
        cell.configureCell(with: article)
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}

