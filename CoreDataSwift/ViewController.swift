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
    var dataArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.backgroundColor = .clear
        
        loadCoreData()
        
    }
    
    func insertCoreData(name:String, number:String) -> Void {
        
        let insertData = NSEntityDescription.insertNewObject(
            forEntityName: entityName, into: dataContext)
        
        insertData.setValue(dataArray.count, forKey: "id")
        insertData.setValue(name, forKey: "name")
        insertData.setValue(number, forKey: "phone")
        
        do {
            try dataContext.save()
            dataArray.add(Album(id: dataArray.count, name: name, number: number))
            tableView.reloadData()
        } catch {
            fatalError("\(error)")
        }
        
    }
    
    func loadCoreData() -> Void {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        do {
            let results =
                try dataContext.fetch(request) as! [NSManagedObject]
            
            dataArray = NSMutableArray()
            
            for result in results {
                
                dataArray.add(Album(id: result.value(forKey: "id") as! Int, name: result.value(forKey: "name") as! String, number: result.value(forKey: "phone") as! String))
                
            }
            
            tableView.reloadData()
            
        } catch {
            fatalError("\(error)")
        }
        
    }
    
    func updateCoreData(id:Int, name:String, number:String) -> Void {
        
        let request =
            NSFetchRequest<NSFetchRequestResult>(
                entityName: entityName)
        
        request.predicate = nil
        
        let updateID = id
        
        request.predicate =
            NSPredicate(format: "id = \(updateID)")
        
        do {
            
            let results = try dataContext.fetch(request) as! [NSManagedObject]
            
            if results.count > 0 {
            
                results[0].setValue(name, forKey: "name")
                results[0].setValue(number, forKey: "phone")
                
                try dataContext.save()
            }
            
            loadCoreData()
            
        } catch {
            fatalError("\(error)")
        }
        
    }
    
    func deletCoreData(id:Int) -> Void {
        
        let request =
            NSFetchRequest<NSFetchRequestResult>(
                entityName: entityName)
        
        request.predicate = nil
        
        let deleteID = id
        
        request.predicate = NSPredicate(format: "id = \(deleteID)")
        
        do {
            
            let results =
                try dataContext.fetch(request) as! [NSManagedObject]
            
            for result in results {
                dataContext.delete(result)
            }
            
            try dataContext.save()
            
            loadCoreData()
            
        } catch {
            fatalError("\(error)")
        }
        
    }
    
    class Album {
        
        var id = Int()
        var name = String()
        var number = String()
        
        init(id:Int, name:String, number:String) {
            self.id = id
            self.name = name
            self.number = number
        }
        
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
    
        let alert = UIAlertController(title: "name", message: "type something", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Please fill in name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Please fill in phone number"
            textField.keyboardType = .phonePad
        }
        
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            
            let name = alert.textFields?[0].text
            let phone = alert.textFields?[1].text
            
            self.insertCoreData(name: name!, number: phone!)
            
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return albumCell.backView.frame.size.height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let CellIdentifier = "Cell\(indexPath.row)"
        var cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: CellIdentifier)
        }
        
        albumCell = AlbumCell(style: .default, reuseIdentifier: CellIdentifier)
        
        let data:Album = dataArray.object(at: indexPath.row) as! ViewController.Album
        
        albumCell.titleLabel.text = data.name
        albumCell.msgLabel.text = data.number
        
        return albumCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "Update", message: "Update the information", preferredStyle: .alert)
        
        let albumData:Album = dataArray.object(at: indexPath.row) as! ViewController.Album
        
        alert.addTextField { (textField) in
            textField.text = albumData.name
        }
        
        alert.addTextField { (textField) in
            textField.text  = albumData.number
        }
        
        let ok = UIAlertAction(title: "Save", style: .default) { (action) in
            
            let name = alert.textFields?[0].text
            let phone = alert.textFields?[1].text
            
            self.updateCoreData(id: indexPath.row, name: name!, number: phone!)
            
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let albumData:Album = dataArray.object(at: indexPath.row) as! ViewController.Album
        
        if editingStyle == .delete {
            
            let alert = UIAlertController(title: "Delete", message: "Are you sure to delete \(albumData.name)'s information", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "OK", style: .default) { (action) in
                
                self.deletCoreData(id: indexPath.row)
                
            }
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alert.addAction(ok)
            alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
            
        }
        
    }

}

