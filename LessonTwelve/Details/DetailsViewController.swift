//
//  DetailsViewController.swift
//  LessonTwelve
//
//  Created by Александр Меренков on 11.11.2022.
//

import UIKit

protocol DetailsViewProtocol: AnyObject {
    var presenter: DetailsPresenterProtocol? { get set }
}

class DetailsViewController: UIViewController {
    
//    MARK: - Properties
    
    var presenter: DetailsPresenterProtocol?
    let configurator: DetailsConfiguratorProtocol = DetailsConfigurator()
    
    private let selectedHero: SuperHero
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 27)
        label.textColor = .header
        return label
    }()
    
    private let descriptionTextView: UITextView = {
        let view = UITextView()
        view.font = UIFont.systemFont(ofSize: 20)
        view.textAlignment = .left
        view.textColor = .black
        view.backgroundColor = .background
        return view
    }()
    
    private let backButtom: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Назад", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 19)
        button.layer.borderWidth = 0.7
        button.layer.borderColor = UIColor.borderColor.cgColor
        button.layer.cornerRadius = 5
        button.backgroundColor = .buttonBackground
        button.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
        return button
    }()
    
//    MARK: - Lifecycle
    
    init(hero: SuperHero) {
        self.selectedHero = hero
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        configureUI()
        view.backgroundColor = .background
    }
    
//    MARK: - Helpers
    
    private func configureUI() {
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(backButtom)
        backButtom.translatesAutoresizingMaskIntoConstraints = false
        backButtom.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backButtom.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        backButtom.widthAnchor.constraint(equalToConstant: 210).isActive = true
        backButtom.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(descriptionTextView)
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        descriptionTextView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: backButtom.topAnchor, constant: -15).isActive = true
        
        nameLabel.text = selectedHero.nick
        descriptionTextView.text = selectedHero.detail
    }
    
//    MARK: - Selectors
    
    @objc private func handleBackButton() {
        presenter?.dissmisDetails()
    }
}
