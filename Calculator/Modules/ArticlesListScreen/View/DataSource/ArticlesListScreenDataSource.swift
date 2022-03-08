//
//  ArticlesListScreenViewController+UITableViewDelegate.swift
//  Calculator
//
//  Created by Кирилл Колесников on 02.03.2022.
//

import Foundation
import UIKit

extension ArticlesListScreenViewController: UITableViewDelegate {
    
}

extension ArticlesListScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.reuseIdentifier, for: indexPath) as? ArticleTableViewCell else { return UITableViewCell() }
        
        let article = Article(image: UIImage(named: "picture"), text: Consts.articleMockText)
        cell.configureCell(with: article)
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}
