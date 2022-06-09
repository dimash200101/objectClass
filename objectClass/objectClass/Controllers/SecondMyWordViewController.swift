//
//  MyWordsViewController.swift
//  objectClass
//
//  Created by Rakat Dinmukhammed on 21/05/22.
//  Copyright © 2018 Galym Anuarbek. All rights reserved.
//

import UIKit
class SecondMyWordViewController: UIViewController {
    
    @IBOutlet weak var words1Table: UITableView!
    var num = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
   
    override func viewDidAppear(_ animated: Bool) {
        words1Table.reloadData()
    }
    func setup() {
        words1Table.dataSource = self
        words1Table.delegate = self
        words1Table.rowHeight = 100
    }
    
}

extension SecondMyWordViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomsList1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = roomsList1[indexPath.row]
        print(indexPath.row)
        print(indexPath)
        print(roomsList1)
        return cell
        
    }
    
    
}
