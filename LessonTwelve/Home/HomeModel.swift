//
//  HomeModel.swift
//  LessonTwelve
//
//  Created by Александр Меренков on 10.11.2022.
//

struct SuperHero {
    let image: String
    var nick: String
    let name: String
    var detail: String
    
    init(image: String, nick: String, name: String, detail: String) {
        self.image = image
        self.nick = nick
        self.name = name
        self.detail = detail
    }
}

struct HeroItem: Codable {
    let id: Int
    let name:  String
    let description: String
}

struct HeroData: Codable {
    let results: [HeroItem]
}

struct HeroAnswer: Codable {
    let data: HeroData
}
