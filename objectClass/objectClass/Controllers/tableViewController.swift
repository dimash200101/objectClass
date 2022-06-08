//
//  tableViewController.swift
//  objectClass
//
//  Created by Rakat Dinmukhammed on 07.05.2022.
//  Copyright © 2022 Galym Anuarbek. All rights reserved.
//

import Foundation
import UIKit

class tableViewController: UIViewController{
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var bt1: UIButton!
    @IBAction func push(_ sender: Any) {
        roomName = tf1.text
    }
    
}
