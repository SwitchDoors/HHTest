//
//  Vacancies.swift
//  HHTest
//
//  Created by Max Shcherbakov on 19/05/2019.
//  Copyright © 2019 Max Shcherbakov. All rights reserved.
//

import UIKit

struct Vacancies: Codable {

    let items: [Vacancy]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
}
