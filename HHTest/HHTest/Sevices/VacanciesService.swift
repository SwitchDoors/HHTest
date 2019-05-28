//
//  VacanciesService.swift
//  HHTest
//
//  Created by Max Shcherbakov on 19/05/2019.
//  Copyright © 2019 Max Shcherbakov. All rights reserved.
//

import UIKit

class VacanciesService: NSObject {
    
    private let fetchCount = 50

    private var isLoading = false
    
    private var currentPage: Int { return vacancies.count / fetchCount }
    
    private let api: VacanciesEndPoint
    
    private(set) var vacancies: [Vacancy] = []
    
    init(api: VacanciesEndPoint) {
        self.api = api
        super.init()
    }
    
    func loadNext(completion: @escaping (Error?) -> ()) {
        
        isLoading = true
        let pageNumber = currentPage
        api.vacancies(perPage: fetchCount, page: pageNumber, completion: { [weak self] result in
            
            guard let self = self else { return }
            self.isLoading = false
            
            switch result {
            case .success(let data):
                self.vacancies += data.items
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        })
    }
    
    func reset() {
        self.vacancies = []
    }
}
