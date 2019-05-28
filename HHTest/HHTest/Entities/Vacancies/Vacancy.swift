//
//  Vacancy.swift
//  HHTest
//
//  Created by Max Shcherbakov on 19/05/2019.
//  Copyright © 2019 Max Shcherbakov. All rights reserved.
//

// зачем модели UIKit?
import UIKit

// почему модель Вакансия - это класс? мб здесь уместно использование структуры?
// при чем тут nsobject?!
class Vacancy: NSObject, Codable {
    
    let name: String
    let salary: Salary?

  // это перечисление можно опустить, т.к. здесь никак не переопределяются ключи для полей
    enum CodingKeys: String, CodingKey {
        case name
        case salary
    }
    
}
