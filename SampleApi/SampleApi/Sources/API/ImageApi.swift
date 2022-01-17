//
//  ImageApi.swift
//  SampleApi
//
//  Created by Artur Gruchała on 17/01/2022.
//

import Foundation

public protocol ImageApiProtocol {
    func getImages(completion: @escaping ([Image]?, Error?) -> Void)
    func getAlbums(completion: @escaping ([Album]?, Error?) -> Void)
}

public enum APIError: Error {
    case noData
    case encodingError
}

public class ImageApi: ImageApiProtocol {
    
    public init() { }
    
    private let baseURL = URL(string: "https://jsonplaceholder.typicode.com/")!
    
    public func getImages(completion: @escaping ([Image]?, Error?) -> Void) {
        callAPI(with: "photos", completion: completion)
    }
    
    public func getAlbums(completion: @escaping ([Album]?, Error?) -> Void) {
        callAPI(with: "albums", completion: completion)
    }
    
    private func callAPI<Model: Codable>(with method: String, completion: @escaping (Model?, Error?) -> Void) {
        let url = baseURL.appendingPathComponent(method)
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, APIError.noData)
                return
            }
            
            do {
                let model = try JSONDecoder().decode(Model.self, from: data)
                completion(model, nil)
                return
            } catch {
                completion(nil, APIError.encodingError)
                return
            }
        }.resume()
    }
}
