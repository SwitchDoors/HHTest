//
//  VacanciesPresenter.swift
//  HHTest
//
//  Created by Max Shcherbakov on 19/05/2019.
//  Copyright © 2019 Max Shcherbakov. All rights reserved.
//

import UIKit

class VacanciesPresenter: NSObject {
    
    private let fetchCount = 50

    private let ddm = VacanciesDDM()
    
    private let vacanciesService = VacanciesService(api: VacanciesEndPoint.shared)
    private var isLoading = false
    
    var view: VacanciesInput!
    
    private var currentPage: Int { return vacanciesService.vacancies.count % fetchCount }
    
    private func loadNext() {
        
        vacanciesService.loadNext { [weak self] (error) in
            self?.update(error: error)
            
        }
    }
    
    private func update(error: Error?) {
        
        if let error = error {
            self.ddm.data = .error(error)
            return
        }
        
        let cellsData = vacanciesService.vacancies.map({ VacancyCellData(vac: $0) })
        ddm.data = .data(cellsData)
        
        self.view.stopPullToRefresh()
        self.view.updateData()
    }
}

extension VacanciesPresenter: VacanciesOutput {
    
    func didLoadView(table: UITableView) {
        
        table.dataSource = ddm
        table.delegate = ddm
        ddm.register(teble: table)
        ddm.didScrollToEnd = { [weak self] in
            self?.loadNext()
        }
    }
    
    func didPullToRefresh() {
        
        vacanciesService.reset()
        vacanciesService.loadNext { [weak self] (error) in
            self?.update(error: error)
            
        }
        
    }
    
}
