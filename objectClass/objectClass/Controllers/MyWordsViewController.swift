//
//  MyWordsViewController.swift
//  objectClass
//
//  Created by Rakat Dinmukhammed on 18/03/22.
//  Copyright © 2018 Galym Anuarbek. All rights reserved.
//

import UIKit
var nums: [String] = []
class MyWordsViewController: UIViewController {
    
    @IBOutlet weak var wordsTable: UITableView!
    var num = 0
    @IBOutlet weak var label1: UILabel!
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

extension MyWordsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = roomsList[indexPath.row]
        print(indexPath.row)
        print(indexPath)
        print(roomsList)
        return cell
        
    }
    
    
}
