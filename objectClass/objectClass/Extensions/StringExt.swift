//
//  Str.swift
//  objectClass
//
//  Created by Rakat Dinmukhammed on 18/03/22.
//  Copyright © 2018 Galym Anuarbek. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
