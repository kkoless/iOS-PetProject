//
//  ArticleTableViewCell.swift
//  PetProject
//
//  Created by Кирилл Колесников on 02.03.2022.
//

import UIKit

final class ArticleTableViewCell: UITableViewCell {
    static let reuseIdentifier: String = "ArticleTableViewCell"
    
    private lazy var pictureImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    private lazy var textArticleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [pictureImageView, textArticleLabel])
        stack.axis = .horizontal
        stack.setCustomSpacing(10, after: pictureImageView)
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with article: Article) {
        textArticleLabel.text = article.text
        pictureImageView.image = article.image
    }
    
}

private extension ArticleTableViewCell {
    func configureUI() {
        contentView.addSubview(horizontalStackView)
        
        pictureImageView.snp.makeConstraints {
            $0.size.equalTo(120)
        }
        
        horizontalStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
        }
    }
}
