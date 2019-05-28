//
//  Vacancy.swift
//  HHTest
//
//  Created by Max Shcherbakov on 19/05/2019.
//  Copyright © 2019 Max Shcherbakov. All rights reserved.
//

import UIKit

class Vacancy: NSObject, Codable {
    
    let name: String
    let salary: Salary?
    
    enum CodingKeys: String, CodingKey {
        case name
        case salary
    }
    
}
