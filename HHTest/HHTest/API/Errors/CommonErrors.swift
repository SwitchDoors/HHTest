//
//  CommonErrors.swift
//  HHTest
//
//  Created by Max Shcherbakov on 19/05/2019.
//  Copyright © 2019 Max Shcherbakov. All rights reserved.
//

// зачем?!
import UIKit

// NSError? это устаревшая конструкция
extension NSError {

  // static var или static let?
  // defaultError используется при декодинге у тебя.
    static var defaultError: NSError = {
    
        return NSError(domain: "hh.ru",
                       code: 400,
                       userInfo: [NSLocalizedDescriptionKey : "Что-то пошло сильно не так"])
    }()
}

//enum DecodignError: Error {
//  var localizedDescription: String  { return "Hmm..Decoding error occurs" }
//}
