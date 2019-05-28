//
//  VacanciesErrorCell.swift
//  HHTest
//
//  Created by Max Shcherbakov on 27/05/2019.
//  Copyright © 2019 Max Shcherbakov. All rights reserved.
//

// это можно опустить
import Foundation

// VacanciesErrorCell будет переопределяться? мб final?
class VacanciesErrorCell: VacanciesBaseCell {
    
    override func configure() {
        textLabel?.numberOfLines = 0
        selectionStyle = .none
      // сначала ты пишешь, что кол-во строк у лэйбла не ограничено, а потом хардкодишь высоту вьюхи. так и надо?
        contentView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
