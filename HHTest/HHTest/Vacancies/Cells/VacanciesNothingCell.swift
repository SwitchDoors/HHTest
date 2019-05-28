//
//  VacanciesNothingCell.swift
//  HHTest
//
//  Created by Max Shcherbakov on 27/05/2019.
//  Copyright © 2019 Max Shcherbakov. All rights reserved.
//

import Foundation

// те же замечания
// непонятный нейминг. мб EmptyVacancyCell?
class VacanciesNothingCell: VacanciesBaseCell {
    
    override func configure() {
        textLabel?.textAlignment = .center
        selectionStyle = .none
        contentView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
