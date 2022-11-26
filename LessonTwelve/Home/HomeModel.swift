//
//  HomeModel.swift
//  LessonTwelve
//
//  Created by Александр Меренков on 10.11.2022.
//

import UIKit

enum HeroType {
    case Marvel
    case DC
}

struct HeroCredentials {
    let image: String
    let nick: String
    let name: String
    let detail: String
    
    init(image: String, nick: String, name: String, detail: String) {
        self.image = image
        self.nick = nick
        self.name = name
        self.detail = detail
    }
}

protocol HeroConfigurator {
    func createHero(image: String, nick: String, name: String, detail: String) -> Hero
}

class MarvelConfigurator: HeroConfigurator {
    var cellBackground = UIColor(displayP3Red: 1, green: 133/255, blue: 82/255, alpha: 1)
    func createHero(image: String, nick: String, name: String, detail: String) -> Hero {
        return MarvelHero(image: image, nick: nick, name: name, detail: detail)
    }
}

class DCConfigurator: HeroConfigurator {
    var cellBackground = UIColor(displayP3Red: 1, green: 123, blue: 123, alpha: 1)
    func createHero(image: String, nick: String, name: String, detail: String) -> Hero {
        return DCHero(image: image, nick: nick, name: name, detail: detail)
    }
}

class HeroManager {
    func create(type: HeroType, credentials: HeroCredentials) -> Hero {
        switch type {
        case .Marvel:
            let configurator = MarvelConfigurator()
            return configurator.createHero(image: credentials.image, nick: credentials.nick, name: credentials.name, detail: credentials.detail)
        case .DC:
            let configurator = DCConfigurator()
            return configurator.createHero(image: credentials.image, nick: credentials.nick, name: credentials.name, detail: credentials.detail)
        }
    }
}

protocol Hero {
    var image: String { get }
    var nick: String { get }
    var name: String { get }
    var detail: String { get }
    var cellBackground: UIColor { get }
}

class MarvelHero: Hero {
    var image: String
    var nick: String
    var name: String
    var detail: String
    
    var cellBackground: UIColor = UIColor(displayP3Red: 1, green: 133/255, blue: 82/255, alpha: 1)
    
    init(image: String, nick: String, name: String, detail: String) {
        self.image = image
        self.nick = nick
        self.name = name
        self.detail = detail
    }
}

class DCHero: Hero {
    var image: String
    var nick: String
    var name: String
    var detail: String
    
    var cellBackground: UIColor = UIColor(displayP3Red: 150/255, green: 122/255, blue: 161/255, alpha: 1)
    
    init(image: String, nick: String, name: String, detail: String) {
        self.image = image
        self.nick = nick
        self.name = name
        self.detail = detail
    }
}


