//
//  HomeModel.swift
//  LessonTwelve
//
//  Created by Александр Меренков on 10.11.2022.
//
import UIKit

enum State: String {
    case subscribe = "Подписаться"
    case unsubscribe = "Отписаться"
}

class SuperHero {
    let image: String
    let nick: String
    let name: String
    let detail: String
    var subscriber: State = .subscribe
    var backgroundColor = UIColor(displayP3Red: 1, green: 133/255, blue: 82/255, alpha: 1)
    
    init(image: String, nick: String, name: String, detail: String) {
        self.image = image
        self.nick = nick
        self.name = name
        self.detail = detail
    }
}

protocol HeroSubscriber: AnyObject {
    func update(color: UIColor)
}

struct WeakSubscriber {
    weak var value: HeroSubscriber?
}

extension SuperHero: HeroSubscriber {
    func update(color: UIColor) {
        backgroundColor = color
    }
}

class Publisher {
    private lazy var subscribers = [WeakSubscriber]()
    
    func add(subscriber: HeroSubscriber) {
        subscribers.append(WeakSubscriber(value: subscriber))
    }
    
    func remote(subscriber: HeroSubscriber) {
        subscribers.removeAll(where: {$0.value === subscriber})
    }
    
    func notify(color: UIColor) {
        subscribers.forEach({$0.value?.update(color: color)})
    }
}
