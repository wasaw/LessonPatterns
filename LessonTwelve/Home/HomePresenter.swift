//
//  HomePresenter.swift
//  LessonTwelve
//
//  Created by Александр Меренков on 09.11.2022.
//
import UIKit

protocol HomePresenterProtocol: AnyObject {
    var router: HomeRouterProtocol? { get set }
    func sendInformation(hero: [SuperHero])
    func loadData()
    func details(hero: SuperHero)
    func subscribe(hero: SuperHero)
    func updateNotify(color: UIColor)
    func updateCollectionView()
    func unsubscribe(hero: SuperHero)
}

class HomePresenter: HomePresenterProtocol {
    
//    MARK: - Properties
    
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    
//    MARK: - Lifecycle
    
    init(view: HomeViewProtocol) {
        self.view = view
    }
    
//    MARK: - Helpers
    
    func sendInformation(hero: [SuperHero]) {
        view?.showInformation(hero: hero)
    }
    
    func loadData() {
        interactor?.loadInformation()
    }
    
    func details(hero: SuperHero) {
        router?.detailsPage(hero: hero)
    }
    
    func subscribe(hero: SuperHero) {
        interactor?.subscribe(hero: hero)
    }
    
    func updateNotify(color: UIColor) {
        interactor?.updateNotify(color: color)
    }
    
    func updateCollectionView() {
        view?.updateCollectionView()
    }
    
    func unsubscribe(hero: SuperHero) {
        interactor?.unsubscribe(hero: hero)
    }
}
