//
//  HomeCell.swift
//  LessonTwelve
//
//  Created by Александр Меренков on 10.11.2022.
//

import UIKit

protocol DetailsButtonProtocol: AnyObject {
    func subscriber(hero: SuperHero)
    func unsubscribe(hero: SuperHero)
}

class HomeCell: UICollectionViewCell {
    static let identifire = "HomeCell"
    
//    MARK: - Properties
    
    weak var delegate: DetailsButtonProtocol?
    private var hero: SuperHero?
    
    private let imageView: UIImageView = {
        let iView = UIImageView()
        iView.layer.cornerRadius = 30
        iView.layer.borderColor = UIColor.lightGray.cgColor
        iView.layer.borderWidth = 1
        iView.layer.masksToBounds = true
        return iView
    }()
    
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 19)
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let subscribeButtom: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Подписаться", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.borderWidth = 0.7
        button.layer.borderColor = UIColor.borderColor.cgColor
        button.layer.cornerRadius = 5
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.backgroundColor = .buttonBackground
        button.addTarget(self, action: #selector(handleDetailsButton), for: .touchUpInside)
        return button
    }()
    
    private let unsubscribeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Отписаться", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.borderWidth = 0.7
        button.layer.borderColor = UIColor.borderColor.cgColor
        button.layer.cornerRadius = 5
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.backgroundColor = .buttonBackground
        button.addTarget(self, action: #selector(handleDetailsButton), for: .touchUpInside)
        return button
    }()
    
//    MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Helpers
    
    private func configureUI() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
                
        let stack = UIStackView(arrangedSubviews: [nicknameLabel, nameLabel, subscribeButtom, unsubscribeButton])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 4
        subscribeButtom.isHidden = true
        unsubscribeButton.isHidden = true
        
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        stack.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15).isActive = true
        stack.rightAnchor.constraint(equalTo: rightAnchor, constant: -5).isActive = true
        stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
        
        layer.borderWidth = 0.7
        layer.borderColor = UIColor.borderColor.cgColor
        layer.cornerRadius = 5
    }
    
    func setInformation(hero: SuperHero, index: Int) {
        self.hero = hero
        imageView.image = UIImage(named: hero.image)
        nicknameLabel.text = hero.nick
        nameLabel.text = hero.name
        tag = index
        if hero.subscriber == .subscribe {
            subscribeButtom.isHidden = false
            unsubscribeButton.isHidden = true
        } else {
            subscribeButtom.isHidden = true
            unsubscribeButton.isHidden = false
        }
        backgroundColor = hero.backgroundColor
    }
    
//    MARK: - Selectors
    
    @objc private func handleDetailsButton() {
        guard let hero = hero else { return }
        if hero.subscriber == .subscribe {
            subscribeButtom.isHidden = true
            unsubscribeButton.isHidden = false
            delegate?.subscriber(hero: hero)
        } else {
            subscribeButtom.isHidden = false
            unsubscribeButton.isHidden = true
            delegate?.unsubscribe(hero: hero)
        }
    }
}
