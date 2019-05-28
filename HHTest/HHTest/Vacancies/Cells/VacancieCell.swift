//
//  VacancieCell.swift
//  HHTest
//
//  Created by Max Shcherbakov on 27/05/2019.
//  Copyright © 2019 Max Shcherbakov. All rights reserved.
//

import UIKit

class VacancieCell: VacanciesBaseCell {
    
    let name = UILabel()
    let salaryFrom = UILabel()
    
    override func configure() {
        name.textColor = UIColor.black
        salaryFrom.textColor = UIColor.purple
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        
        contentView.addWithoutMask([name, salaryFrom])
        
        var constraints = [name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                           name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                           name.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)]
        
        constraints += [salaryFrom.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                        salaryFrom.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 10)]
        
        constraints.append(name.trailingAnchor.constraint(equalTo: salaryFrom.leadingAnchor, constant: -10))
        
        salaryFrom.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        name.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: .horizontal)
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
