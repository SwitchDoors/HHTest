//
//  VacancesViewProtocols.swift
//  HHTest
//
//  Created by Max Shcherbakov on 19/05/2019.
//  Copyright © 2019 Max Shcherbakov. All rights reserved.
//

import Foundation
import UIKit

protocol VacanciesInput {
    
    func updateData()
    
    func stopPullToRefresh()
}

protocol VacanciesOutput {
    
    func didLoadView(table: UITableView)
    
    func didPullToRefresh()
}
