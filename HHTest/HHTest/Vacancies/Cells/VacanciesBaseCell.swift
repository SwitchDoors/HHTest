//
//  VacanciesCells.swift
//  HHTest
//
//  Created by Max Shcherbakov on 21/05/2019.
//  Copyright © 2019 Max Shcherbakov. All rights reserved.
//

import UIKit


class VacanciesBaseCell: UITableViewCell, ReusableWithID {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

  // зачем? почему не определить интерфейс VacanciesBaseCell (ConfigurableCell) с одним методом configure()?
//  protocol ConfigurableCell where Self: UITableViewCell {
//
//    func configure()
//  }

    func configure() {
        fatalError("must be implemented")
    }
}

