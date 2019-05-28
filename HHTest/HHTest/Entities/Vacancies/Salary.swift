//
//  Salary.swift
//  HHTest
//
//  Created by Max Shcherbakov on 19/05/2019.
//  Copyright © 2019 Max Shcherbakov. All rights reserved.
//

import UIKit

// те же замечания, что и для Vacancy
class Salary: NSObject, Codable {

  // раз уж в модели Вакансия зп является опциональным свойством, то почему и здесь оно опционально?
    let from: Int?
    
    enum CodingKeys: String, CodingKey {
        case from
    }
    
}
