//
//  HomeConfigurator.swift
//  LessonTwelve
//
//  Created by Александр Меренков on 09.11.2022.
//

protocol HomeConfiguratorProtocol: AnyObject {
    func configure(with viewController: HomeViewController)
}

class HomeCofigurator: HomeConfiguratorProtocol {
    
//    MARK: - Helpers
    
    func configure(with viewController: HomeViewController) {
        let presenter = HomePresenter(view: viewController)
        let interactor = HomeInteractor(presenter: presenter)
        let router = HomeRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }

}
