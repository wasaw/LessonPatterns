//
//  DetailsRouter.swift
//  LessonTwelve
//
//  Created by Александр Меренков on 11.11.2022.
//

protocol DetailsRouterProtocol: AnyObject {
    var viewController: DetailsViewController? { get set }
    func backToHome()
}

class DetailsRouter: DetailsRouterProtocol {
    
//    MARK: - Properties
    
    weak var viewController: DetailsViewController?
    
//    MARK: - Lifecycle
    
    init(viewController: DetailsViewController?) {
        self.viewController = viewController
    }
    
//    MARK: - Helpers
    
    func backToHome() {
        viewController?.dismiss(animated: true)
    }
}
