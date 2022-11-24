//
//  HomeRouter.swift
//  LessonTwelve
//
//  Created by Александр Меренков on 10.11.2022.
//

import UIKit
import Foundation

protocol HomeRouterProtocol: AnyObject {
    var viewController: HomeViewController? { get set }
    func detailsPage(hero: Hero)
}

class HomeRouter: HomeRouterProtocol {
    
//    MARK: - Properties
    
    weak var viewController: HomeViewController?
    
//    MARK: - Lifecycle
    
    init(viewController: HomeViewController!) {
        self.viewController = viewController
    }
    
//    MARK: - Helpers
    
    func detailsPage(hero: Hero) {
        let vc = DetailsViewController(hero: hero)
        vc.modalPresentationStyle = .fullScreen
        viewController?.present(vc, animated: true, completion: nil)
    }
}
