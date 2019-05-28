//
//  Array.swift
//  HHTest
//
//  Created by Max Shcherbakov on 19/05/2019.
//  Copyright © 2019 Max Shcherbakov. All rights reserved.
//

import UIKit

extension UIView {
    
    func addWithoutMask(_ subs: [UIView]) {
        
        subs.forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        })
    }
    
}
