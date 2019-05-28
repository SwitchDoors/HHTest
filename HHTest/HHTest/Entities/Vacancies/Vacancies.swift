//
//  Vacancies.swift
//  HHTest
//
//  Created by Max Shcherbakov on 19/05/2019.
//  Copyright © 2019 Max Shcherbakov. All rights reserved.
//

import UIKit

// те же замечения, что и для Vacancy

// какой смысл от введения этой модели? содержит только одно поле
// во всех случаях Vacancies можно заменить на [Vacancy]
struct Vacancies: Codable {

    let items: [Vacancy]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
}
