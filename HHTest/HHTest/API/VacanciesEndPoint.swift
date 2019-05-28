//
//  VacanciesEndPoint.swift
//  HHTest
//
//  Created by Max Shcherbakov on 19/05/2019.
//  Copyright © 2019 Max Shcherbakov. All rights reserved.
//

import UIKit

enum Result<T, E> {
    case success(T)
    case failure(E)
}

class VacanciesEndPoint: NSObject {
    
    private enum Services: String {
        case vacancies = "https://api.hh.ru/vacancies"
    }
    
    private let session = URLSession(configuration: .default, delegate: nil, delegateQueue: nil)
    
    private override init() { super.init() }
    
    static let shared = VacanciesEndPoint()

    func vacancies(perPage: Int, page: Int, completion: @escaping (Result<Vacancies, Error>) -> ()) {
        
        let urlStr = "\(Services.vacancies.rawValue)?per_page=\(perPage)&page=\(page)"
        var request = URLRequest(url: URL(string: urlStr)!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        session.dataTask(with: request) { (data, _, error) in
            
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            do {
                
                let decodeedVacancies: Vacancies = try self.decode(data: data)
                
                DispatchQueue.main.async {
                    completion(.success(decodeedVacancies))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
            
        }.resume()
        
    }
    
    private func decode<T: Codable>(data: Data?) throws -> T {
        
        guard let data = data else {
            throw NSError.defaultError
        }
        
        return try JSONDecoder().decode(T.self, from: data)
        
    }
}
