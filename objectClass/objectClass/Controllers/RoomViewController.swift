//
//  ViewControllerRooms.swift
//  objectClass
//
//  Created by Rakat Dinmukhammed on 06.05.2022.
//  Copyright © 2022 Galym Anuarbek. All rights reserved.
//

import Foundation
import UIKit
//var roomsList: [String:[String]] = [:]
var roomsList: [String] = []
var roomsList1: [String] = []



class RoomViewController: UIViewController {
    
    
    
    @IBOutlet weak var roomsTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        roomsTable.reloadData()
    }
    
    func setup() {
        if roomsTable == nil{
            return
        }
        roomsTable.dataSource = self
        roomsTable.delegate = self
        roomsTable.rowHeight = 100
    }
    
    
    
    
    
}

extension RoomViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return roomsList.keys.count
        return roomsList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        //cell.textLabel?.text = Array(roomsList.keys)[indexPath.row]
        cell.textLabel?.text = Array(roomsList)[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    
    
    
}
