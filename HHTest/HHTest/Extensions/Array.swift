//
//  Array.swift
//  HHTest
//
//  Created by Max Shcherbakov on 19/05/2019.
//  Copyright © 2019 Max Shcherbakov. All rights reserved.
//

import UIKit

// в файле Array.swift расширение uiview?
extension UIView {

  // почему бы не написать понятное subviews? это же не Си, где принято сокращать
    func addWithoutMask(_ subs: [UIView]) {

      // круглые скобки можно опустить
        subs.forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
          // self можно не указывать, т.к. не возникает неоднозначности в трактовке
            self.addSubview($0)
        })
    }
    
}
