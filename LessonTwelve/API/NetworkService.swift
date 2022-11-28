//
//  NetworkService.swift
//  LessonTwelve
//
//  Created by Александр Меренков on 27.11.2022.
//

import Foundation

enum Method: String {
    case get, put, post
    
    var value: String {
        return self.rawValue.uppercased()
    }
}

class NetworkService {
    static let shared = NetworkService()
    
//    MARK: - Properties
    private let config = NetworkConfiguration()
    private let configuration = URLSessionConfiguration.default
    private lazy var urlSession: URLSession? = {
        let urlSession = URLSession(configuration: configuration)
        return urlSession
    }()
//    MARK: - Helpers
    
    func request(name: String, method: Method, parameters: [String: String] = [String: String](), completion: @escaping(HeroItem?) -> Void) {
        let apiPath = "\(config.getBaseUrl())name=\(name)&\(config.getEndUrl())"
        guard let url = URL(string: apiPath) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.value
        let headers = config.getHeaders()
        for header in headers {
            urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
        }
        
        let dataTask = urlSession?.dataTask(with: urlRequest, completionHandler: { data, urlResponse, error in
            if let error = error {
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                }
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    var json = String(data: data, encoding: .utf8)
                    let answer = JsonHelper.shared.decode(data: data)
                    let data = answer?.data
                    let result = data?.results[0]
                    completion(result)
                }
            }
        })
        dataTask?.resume()
    }
}
