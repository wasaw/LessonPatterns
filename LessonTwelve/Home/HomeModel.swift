//
//  HomeModel.swift
//  LessonTwelve
//
//  Created by Александр Меренков on 10.11.2022.
//

import UIKit

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

protocol HeroFactory {
    func createHero(image: String, nick: String, name: String, detail: String) -> Hero
}

class MarvelFactory: HeroFactory {
    var cellBackground = UIColor(displayP3Red: 1, green: 133/255, blue: 82/255, alpha: 1)
    func createHero(image: String, nick: String, name: String, detail: String) -> Hero {
        return MarvelHero(image: image, nick: nick, name: name, detail: detail)
    }
}

class DCFactory: HeroFactory {
    var cellBackground = UIColor(displayP3Red: 1, green: 123, blue: 123, alpha: 1)
    func createHero(image: String, nick: String, name: String, detail: String) -> Hero {
        return DCHero(image: image, nick: nick, name: name, detail: detail)
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

class Publisher {
    private var allHero: [Hero] = []
    
    func addHero(factory: HeroFactory, credentials: HeroCredentials) {
        let newHero = factory.createHero(image: credentials.image, nick: credentials.nick, name: credentials.name, detail: credentials.detail)
        allHero.append(newHero)
        allHero.shuffle()
    }
    
    func getCount() -> Int {
        return allHero.count
    }
    
    func indexHero(index: Int) -> Hero {
        return allHero[index]
    }
    
    func indexColor(index: Int) -> UIColor {
        return allHero[index].cellBackground
    }
}

