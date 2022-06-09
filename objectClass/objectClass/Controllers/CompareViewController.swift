//
//  CompareViewController.swift
//  objectClass
//
//  Created by Dinmukhammed on 08.06.2022.
//  Copyright © 2022 Galym Anuarbek. All rights reserved.
//

import Foundation
import UIKit

var objectList: [String] = []

class CompareViewController: UIViewController {
 
    
    
    @IBOutlet weak var wordsTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        wordsTable.reloadData()
    }
    func setup() {
        wordsTable.dataSource = self
        wordsTable.delegate = self
        wordsTable.rowHeight = 100
    }
    
   
    
    
    
}
 
extension CompareViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = objectList[indexPath.row]
        print(indexPath.row)
        print(indexPath)
        print(roomsList)
        return cell
        
    }
    
    
}
