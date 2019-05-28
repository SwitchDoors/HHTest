//
//  Salary.swift
//  HHTest
//
//  Created by Max Shcherbakov on 19/05/2019.
//  Copyright © 2019 Max Shcherbakov. All rights reserved.
//

import UIKit

class Salary: NSObject, Codable {
    
    let from: Int?
    
    enum CodingKeys: String, CodingKey {
        case from
    }
    
}
