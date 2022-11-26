//
//  HomeViewController.swift
//  LessonTwelve
//
//  Created by Александр Меренков on 09.11.2022.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    func showInformation(hero: [SuperHero])
    func updateCollectionView()
}

class HomeViewController: UIViewController, HomeViewProtocol {
    
//    MARK: - Properties
    
    var presenter: HomePresenterProtocol?
    let configurator: HomeConfiguratorProtocol = HomeCofigurator()
    let buttonBackground: [UIColor] = [.perivincle, .khaki, .cgBlue]
    var buttonBackgorundIndex = 0
    
    private let selectersView = UIView()
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберите новый цвет для подписавшихся блоков"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        return label
    }()
    private let colorButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 0.7
        btn.addTarget(self, action: #selector(handleColorButton), for: .touchUpInside)
        return btn
    }()
    private var collectionView: UICollectionView?
    
    private var superhero: [SuperHero]? {
        didSet {
            collectionView?.reloadData()
        }
    }
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurator.configure(with: self)
        
        configureSelectersUI()
        configureUI()
        presenter?.loadData()
        view.backgroundColor = .background
    }

//    MARK: - Helpers
    
    private func configureSelectersUI() {
        view.addSubview(selectersView)
        selectersView.translatesAutoresizingMaskIntoConstraints = false
        selectersView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        selectersView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        selectersView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        selectersView.heightAnchor.constraint(equalToConstant: 95).isActive = true
        
        selectersView.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.centerXAnchor.constraint(equalTo: selectersView.centerXAnchor).isActive = true
        textLabel.topAnchor.constraint(equalTo: selectersView.topAnchor, constant:  3).isActive = true
        textLabel.widthAnchor.constraint(equalToConstant: 240).isActive = true
        
        colorButton.backgroundColor = buttonBackground[buttonBackgorundIndex]
        selectersView.addSubview(colorButton)
        colorButton.translatesAutoresizingMaskIntoConstraints = false
        colorButton.centerXAnchor.constraint(equalTo: selectersView.centerXAnchor).isActive = true
        colorButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 7).isActive = true
        colorButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        colorButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func configureUI() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        guard let collectionView = collectionView else { return }
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifire)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: selectersView.bottomAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.backgroundColor = .background
    }
    
    func showInformation(hero: [SuperHero]) {
        superhero = hero
    }
    
    func updateCollectionView() {
        collectionView?.reloadData()
        buttonBackgorundIndex = Int.random(in: 0...2)
        colorButton.backgroundColor = buttonBackground[buttonBackgorundIndex]
    }
    
//    MARK: - Selectors
    
    @objc private func handleColorButton() {
        presenter?.updateNotify(color: buttonBackground[buttonBackgorundIndex])
    }
}

//  MARK: - Extensions

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let superhero = superhero {
            return superhero.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifire, for: indexPath) as? HomeCell else { return UICollectionViewCell() }
        if let superhero = superhero {
            cell.setInformation(hero: superhero[indexPath.item], index: indexPath.item)
            cell.delegate = self
        }
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 165, height: 215)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 25, bottom: 15, right: 25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
}

extension HomeViewController: DetailsButtonProtocol {
    func subscriber(hero: SuperHero) {
        presenter?.subscribe(hero: hero)
    }
    
    func unsubscribe(hero: SuperHero) {
        presenter?.unsubscribe(hero: hero)
    }
}
