//
//  PizzaCell.swift
//  PizzaTest
//
//  Created by Konstantin on 03.04.2023.
//

import UIKit

class PizzaCell: UITableViewCell {
    
    private lazy var mainImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFill
        return element
    }()
    
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.numberOfLines = 0
        element.font = UIFont.systemFont(ofSize: 17)
        return element
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let element = UILabel()
        element.numberOfLines = 0
        element.font = UIFont.systemFont(ofSize: 13)
        element.textColor = .gray
        return element
    }()
    
    private lazy var coastView: UIView = {
        let element = UIView()
        element.backgroundColor = .red
        element.layer.cornerRadius = 8
        return element
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 10
//        element.distribution = .fillProportionally
//        element.backgroundColor = .yellow
        return element
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setConstraint()
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        // Включите автоматическое изменение размера содержимого
//        // в соответствии с ограничениями
//
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            contentView.topAnchor.constraint(equalTo: topAnchor),
//            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ])
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Метод для настройки ячейки
    
    func configure(with model: PizzaModel) {
        titleLabel.text = model.name
        descriptionLabel.text = model.ingredients
        mainImageView.image = model.image
    }
}

extension PizzaCell {
    
    
    private func setConstraint() {
        let widthStack = self.frame.width - 32 - 132
        self.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(mainImageView)
        contentView.addSubview(verticalStackView)
        
//        self.snp.makeConstraints { make in
//            make.height.equalTo(180)
////            make.leading.trailing.equalToSuperview()
//        }
        
        mainImageView.snp.makeConstraints { make in
            make.width.height.equalTo(132)
            make.leading.top.equalToSuperview().inset(16)
            make.bottom.lessThanOrEqualToSuperview().inset(16)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.leading.equalTo(mainImageView.snp.trailing).offset(32)
            make.top.bottom.trailing.equalToSuperview().inset(16)
            make.width.equalTo(widthStack)
        }
        
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
        verticalStackView.addArrangedSubview(coastView)

        titleLabel.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        descriptionLabel.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        coastView.snp.makeConstraints { make in
            make.width.equalTo(87)
            make.height.equalTo(32)
        }
    }
}
