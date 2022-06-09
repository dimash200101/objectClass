//
//  CompareButton.swift
//  objectClass
//
//  Created by Dinmukhammed on 08.06.2022.
//  Copyright © 2022 Galym Anuarbek. All rights reserved.
//

import Foundation

import UIKit

var objectList11 = [[String]]()


class CompareButton: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func act(_ sender: Any) {
        let num1 = roomsList.count
    
         
                for i in 0...(num1-1) {
                    if roomsList1.contains(roomsList[i]){
                        print("Yes")
                    }
                    else{
                        objectList.append(roomsList[i])
                    }


    }
    
    
}
}
