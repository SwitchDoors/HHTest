//
//  CommonErrors.swift
//  HHTest
//
//  Created by Max Shcherbakov on 19/05/2019.
//  Copyright © 2019 Max Shcherbakov. All rights reserved.
//

import UIKit

extension NSError {

    static var defaultError: NSError = {
    
        return NSError(domain: "hh.ru",
                       code: 400,
                       userInfo: [NSLocalizedDescriptionKey : "Что-то пошло сильно не так"])
    }()
}
