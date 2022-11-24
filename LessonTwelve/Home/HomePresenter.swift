//
//  HomePresenter.swift
//  LessonTwelve
//
//  Created by Александр Меренков on 09.11.2022.
//

protocol HomePresenterProtocol: AnyObject {
    var router: HomeRouterProtocol? { get set }
    func sendInformation(hero: Publisher)
    func loadData()
    func details(hero: Hero)
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
    
    func sendInformation(hero: Publisher) {
        view?.showInformation(hero: hero)
    }
    
    func loadData() {
        interactor?.loadInformation()
    }
    
    func details(hero: Hero) {
        router?.detailsPage(hero: hero)
    }
}
