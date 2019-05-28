//
//  ReusableView.swift
//  HHTest
//
//  Created by Max Shcherbakov on 19/05/2019.
//  Copyright © 2019 Max Shcherbakov. All rights reserved.
//

import Foundation
import UIKit

protocol ReusableWithID: class {
    static var reusableId: String { get }
}
extension ReusableWithID where Self: UIView {
    
    static var reusableId: String {
        return NSStringFromClass(self)
    }
}
