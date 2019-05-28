//
//  VacanciesErrorCell.swift
//  HHTest
//
//  Created by Max Shcherbakov on 27/05/2019.
//  Copyright © 2019 Max Shcherbakov. All rights reserved.
//

import Foundation

class VacanciesErrorCell: VacanciesBaseCell {
    
    override func configure() {
        textLabel?.numberOfLines = 0
        selectionStyle = .none
        contentView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
