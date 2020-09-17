//
//  Album.swift
//  CoreDataSwift
//
//  Created by iverson1234tw on 2020/6/19.
//  Copyright © 2020 josh.chen. All rights reserved.
//

import UIKit

class AlbumC: NSObject {    

    var id:Int
    var name:String
    var number:String
    
    init(id:Int, name:String, number:String) {
        self.id = id
        self.name = name
        self.number = number
    }
    
}
