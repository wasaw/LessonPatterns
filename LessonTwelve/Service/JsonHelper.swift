//
//  JsonHelper.swift
//  LessonTwelve
//
//  Created by Александр Меренков on 28.11.2022.
//

import Foundation

class JsonHelper {
    static let shared = JsonHelper()
    private var jsonDecoder = JSONDecoder()
    
    func decode(data: Data) -> HeroAnswer? {
        return try? jsonDecoder.decode(HeroAnswer.self, from: data)
    }
}
