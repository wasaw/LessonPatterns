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
}

class HomeViewController: UIViewController, HomeViewProtocol {
    
//    MARK: - Properties
    
    var presenter: HomePresenterProtocol?
    let configurator: HomeConfiguratorProtocol = HomeCofigurator()
    
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
        presenter?.configureView()
        
        configureUI()
        presenter?.loadData()
        view.backgroundColor = .background
    }

//    MARK: - Helpers
    
    private func configureUI() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        guard let collectionView = collectionView else { return }
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifire)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.backgroundColor = .background
    }
    
    func showInformation(hero: [SuperHero]) {
        superhero = hero
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
    func openDetails(index: Int) {
        guard let superhero = superhero else { return }
        presenter?.details(hero: superhero[index])
    }
}
