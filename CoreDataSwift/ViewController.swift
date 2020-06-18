//
//  ViewController.swift
//  CoreDataSwift
//
//  Created by iverson1234tw on 2020/6/18.
//  Copyright © 2020 josh.chen. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let dataContext = (UIApplication.shared.delegate as! AppDelegate)
        .persistentContainer.viewContext
    let entityName = "Album"
    
    var albumCell = AlbumCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.backgroundColor = UIColor.clear
        
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
    
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return albumCell.backView.frame.size.height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let CellIdentifier = "Cell\(indexPath.row)"
        var cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: CellIdentifier)
        }
        
        albumCell = AlbumCell(style: .default, reuseIdentifier: CellIdentifier)
        
        albumCell.photoImageView.backgroundColor = .red
        albumCell.titleLabel.text = "test"
        albumCell.msgLabel.text = "message"
        
        return albumCell
    }


}

