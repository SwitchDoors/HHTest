//
//  ViewController.swift
//  HHTest
//
//  Created by Max Shcherbakov on 19/05/2019.
//  Copyright © 2019 Max Shcherbakov. All rights reserved.
//

import UIKit

class VacanciesVC: UIViewController {
    
    private let table = UITableView()
    
    private let ddm = VacanciesDDM()
    
    var presenter: VacanciesOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Для простоты
        let int = VacanciesPresenter()
        int.view = self
        
        presenter = int
        
        makeConstraints()
        configure()
    }
    
    private func configure() {
        
        title = "Вакансии"
        
        table.refreshControl = makeRefreshControl()
        table.sectionFooterHeight = 0
        table.sectionHeaderHeight = 0
        
        presenter.didLoadView(table: table)
    }
    
    private func makeRefreshControl() -> UIRefreshControl {
        
        let control = UIRefreshControl()
        control.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        
        return control
    }
    
    @objc private func pullToRefresh() {
        
        presenter.didPullToRefresh()
    }
    
}

extension VacanciesVC: VacanciesInput {
    
    func updateData() {
        table.reloadData()
    }
    
    func stopPullToRefresh() {
        table.refreshControl?.endRefreshing()
    }
}

private extension VacanciesVC {
    
    
    private func makeConstraints() {
        
        view.addWithoutMask([table])
        
        let constraints = [table.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                           table.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                           table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
                           table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)]
        
        NSLayoutConstraint.activate(constraints)
    }
}

