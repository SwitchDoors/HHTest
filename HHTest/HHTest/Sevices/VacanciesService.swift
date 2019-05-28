//
//  VacanciesService.swift
//  HHTest
//
//  Created by Max Shcherbakov on 19/05/2019.
//  Copyright © 2019 Max Shcherbakov. All rights reserved.
//

// зачем тут uikit?
import UIKit

// мб стоило бы для начала определить интерфейс VacanciesService, а затем задать ему реализацию?
// в интерефейсы задал бы методы с которыми можно работать, а так не очень понятно, что к чему

// VacanciesService предполагается наследовать? если нет, то лучше сразу писать final
// зачем наследоваться от NSObject?!
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
      // зачем определять pageNumber, если можно currentPage подставить как аргумент
        let pageNumber = currentPage
        api.vacancies(perPage: fetchCount, page: pageNumber, completion: { [weak self] result in

          // а в этом случае ошибку не возвратим?
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

  // isLoading = false забыл
    func reset() {
        self.vacancies = []
    }
}
