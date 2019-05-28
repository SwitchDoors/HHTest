//
//  VacanciesDDM.swift
//  HHTest
//
//  Created by Max Shcherbakov on 19/05/2019.
//  Copyright © 2019 Max Shcherbakov. All rights reserved.
//

import UIKit

struct VacancyCellData {
    let name: String
    let salaryFrom: String
    
    init(vac: Vacancy) {
        self.name = vac.name
        self.salaryFrom = vac.salary?.from != nil ? "\(vac.salary!.from!)" : "N/A"
    }
}

enum VacanciesDDMData {
    case data([VacancyCellData])
    case nothing
    case error(Error)
    
    var number: Int {
        switch self {
        case .data(let data): return data.count
        case .nothing, .error: return 1
        }
    }
}

class VacanciesDDM: NSObject {

    var data: VacanciesDDMData = .nothing
    
    var didScrollToEnd: (() -> ())?
    
    func register(teble: UITableView) {
        teble.register(VacancieCell.self, forCellReuseIdentifier: VacancieCell.reusableId)
        teble.register(VacanciesErrorCell.self, forCellReuseIdentifier: VacanciesErrorCell.reusableId)
        teble.register(VacanciesNothingCell.self, forCellReuseIdentifier: VacanciesNothingCell.reusableId)
    }
}

extension VacanciesDDM: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if case let VacanciesDDMData.data(data) = data,
            indexPath.row == data.count - 1 {
            didScrollToEnd?()
        }
        
    }
}

extension VacanciesDDM: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.number
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch data {
        case .data(let data):
            
            let cell = tableView.dequeueReusableCell(withIdentifier: VacancieCell.reusableId, for: indexPath) as! VacancieCell
            
            let vacancy = data[indexPath.row]
            cell.name.text = vacancy.name
            cell.salaryFrom.text = "\(indexPath.row)"
            
            return cell
            
        case .nothing:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: VacanciesNothingCell.reusableId, for: indexPath) as! VacanciesNothingCell
            cell.textLabel?.text = "Pull to refresh"
            return cell
            
        case .error(let error):
            
            let cell = tableView.dequeueReusableCell(withIdentifier: VacanciesErrorCell.reusableId, for: indexPath) as! VacanciesErrorCell
            cell.textLabel?.text = error.localizedDescription
            return cell
        }
    }
    
}

