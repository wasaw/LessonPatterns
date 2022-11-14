//
//  DetailsPresenter.swift
//  LessonTwelve
//
//  Created by Александр Меренков on 11.11.2022.
//

protocol DetailsPresenterProtocol: AnyObject {
    var router: DetailsRouterProtocol? { get set }
    func dissmisDetails()
}

class DetailsPresenter: DetailsPresenterProtocol {
    
//    MARK: - Proterties
    
    weak var view: DetailsViewController?
    var interactor: DetailsInteractorProtocol?
    var router: DetailsRouterProtocol?
    
//    MARK: - Lifecycle
    
    init(view: DetailsViewController) {
        self.view = view
    }
    
//    MARK: - Helpers
    
    func dissmisDetails() {
        router?.backToHome()
    }
}
