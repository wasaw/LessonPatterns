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
}

class HomeRouter: HomeRouterProtocol {
    
//    MARK: - Properties
    
    weak var viewController: HomeViewController?
    
//    MARK: - Lifecycle
    
    init(viewController: HomeViewController!) {
        self.viewController = viewController
    }
}
