//
//  DetailsInteractor.swift
//  LessonTwelve
//
//  Created by Александр Меренков on 11.11.2022.
//

protocol DetailsInteractorProtocol: AnyObject {
    var presenter: DetailsPresenterProtocol? { get set }
}

class DetailsInteractor: DetailsInteractorProtocol {
    
//    MARK: - Properties
    
    weak var presenter: DetailsPresenterProtocol?
    
//    MARK: - Lifecycle
    
    init(presenter: DetailsPresenterProtocol) {
        self.presenter = presenter
    }
}
