//
//  HomeInteractor.swift
//  LessonTwelve
//
//  Created by Александр Меренков on 09.11.2022.
//

protocol HomeInteractorProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    func loadInformation()
}

class HomeInteractor: HomeInteractorProtocol {
    
//    MARK: - Properties
    weak var presenter: HomePresenterProtocol?
    
        
//    MARK: - Lifecycle
    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
    }
    
//    MARK: - Helpers
    
    func loadInformation() {
        var avengers = SuperHero(image: "avengers", nick: "", name: "Avengers", detail: "")
        var xMan = SuperHero(image: "x-men", nick: "", name: "X-Men", detail: "")
        var captain = SuperHero(image: "captain", nick: "", name: "Steven Rogers", detail: "")
        var hulk = SuperHero(image: "hulk", nick: "", name: "Bruce Banner", detail: "")
        var tor = SuperHero(image: "tor", nick: "=", name: "Thor Odinson", detail: "")
        var deadpool = SuperHero(image: "deadpool", nick: "", name: "Winston Wilson", detail: "")
      
        var groupOfHero:[SuperHero] = []
        
        NetworkService.shared.request(name: "Hulk", method: .get) { result in
            guard let result = result else { return }
            hulk.nick = result.name
            hulk.detail = result.description
            groupOfHero.append(hulk)
            self.statusCheck(groupOfHero)
        }
        
        NetworkService.shared.request(name: "Deadpool", method: .get) { result in
            guard let result = result else { return }
            deadpool.nick = result.name
            deadpool.detail = result.description
            groupOfHero.append(deadpool)
            self.statusCheck(groupOfHero)
        }
        
        NetworkService.shared.request(name: "Captain%20America", method: .get) { result in
            guard let result = result else { return }
            captain.nick = result.name
            captain.detail = result.description
            groupOfHero.append(captain)
            self.statusCheck(groupOfHero)
        }
        
        NetworkService.shared.request(name: "Avengers", method: .get) { result in
            guard let result = result else { return }
            avengers.nick = result.name
            avengers.detail = result.description
            groupOfHero.append(avengers)
            self.statusCheck(groupOfHero)
        }
        
        NetworkService.shared.request(name: "X-Men", method: .get) { result in
            guard let result = result else { return }
            xMan.nick = result.name
            xMan.detail = result.description
            groupOfHero.append(xMan)
            self.statusCheck(groupOfHero)
        }
        
        NetworkService.shared.request(name: "Thor", method: .get) { result in
            guard let result = result else { return }
            tor.nick = result.name
            tor.detail = result.description
            groupOfHero.append(tor)
            self.statusCheck(groupOfHero)
        }
    }
    
    private func statusCheck(_ result: [SuperHero]) {
        if result.count == 6 {
            self.presenter?.sendInformation(hero: result)
        }
    }
    
}
