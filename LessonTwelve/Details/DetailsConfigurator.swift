//
//  DetailsConfigurator.swift
//  LessonTwelve
//
//  Created by Александр Меренков on 11.11.2022.
//

protocol DetailsConfiguratorProtocol: AnyObject {
    func configure(with viewController: DetailsViewController)
}

class DetailsConfigurator: DetailsConfiguratorProtocol {
    
//    MARK: - Helpers
    func configure(with viewController: DetailsViewController) {
        let presenter = DetailsPresenter(view: viewController)
        let interactor = DetailsInteractor(presenter: presenter)
        let router = DetailsRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
