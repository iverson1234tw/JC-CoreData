//
//  SwiftHeader.swift
//  CoreDataSwift
//
//  Created by iverson1234tw on 2020/6/18.
//  Copyright © 2020 josh.chen. All rights reserved.
//

import Foundation
import UIKit

let AppWidth = UIScreen.main.bounds.size.width
let AppHeight = UIScreen.main.bounds.size.height

func setTopBarShadow(view:UIView) -> Void {
    
    view.layer.shadowRadius = 2.5
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOpacity = 0.5
    view.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
    
}
