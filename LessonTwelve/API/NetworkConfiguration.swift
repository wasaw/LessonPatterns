//
//  NetworkConfiguration.swift
//  LessonTwelve
//
//  Created by Александр Меренков on 27.11.2022.
//

import Foundation

class NetworkConfiguration {
    
//    MARK: - Properties
    
    private let apiUrl = "https://gateway.marvel.com/v1/public/characters?"
    private let ts = "1"
    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? ""
    private let hash = Bundle.main.infoDictionary?["HASH"] as? String ?? ""
    
//    MARK: - Helpers
    
    func getHeaders() -> [String: String] {
        return ["X-API-KEY": apiKey]
    }
    
    func getBaseUrl() -> String {
        return apiUrl
    }
    
    func getEndUrl() -> String {
        return "ts=" + ts + "&apikey=" + apiKey + "&hash=" + hash
    }
}
