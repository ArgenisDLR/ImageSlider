//
//  APIClient.swift
//  PinterestFun
//
//  Created by argenis delarosa on 4/13/19.
//  Copyright © 2019 argenis delarosa. All rights reserved.
//

import Foundation

enum Either<T> {
    case success
    case error(Error)
}

protocol APIClient {
    var session: URLSession { get }
    func get<T: Codable>(with request: URLRequest, completion: @escaping (Either<[T]>) -> Void)
}

extension APIClient {
    func get<T: Codable>(with request: URLRequest, completion: @escaping (Either<[T]>) -> Void) {
        let task = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completion(.error(error!))
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                print("Error: with response!")
                return
            }

            guard let value = try? JSONDecoder().decode([T].self, from: data!) else {
                print("Decoder error!")
                return
            }
            DispatchQueue.main.async {
                completion(.success)
            }
        }
        task.resume()
    }
}
