//
//  AlbumCell.swift
//  CoreDataSwift
//
//  Created by iverson1234tw on 2020/6/18.
//  Copyright © 2020 josh.chen. All rights reserved.
//

import UIKit
import SnapKit

class AlbumCell: UITableViewCell {
    
    var backView = UIView()
    var photoImageView = UIImageView()
    var titleLabel = UILabel()
    var msgLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initialize()
        
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        backView.snp.makeConstraints { (make) in
            
            make.left.equalTo(contentView)
            make.top.equalTo(contentView)
            make.right.equalTo(contentView)
            make.bottom.equalTo(contentView)
            
        }
        
        photoImageView.snp.makeConstraints { (make) in
            
            make.left.equalTo(backView).offset(10)
            make.top.equalTo(backView).offset(10)
            make.right.equalTo(backView).offset(-10)
            make.bottom.equalTo(backView).offset(-10)
            
        }
        
        titleLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(photoImageView.snp.right).offset(10)
            make.top.equalTo(photoImageView)
            
        }
        
        msgLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom)
            
        }
        
    }
    
    func initialize() -> Void {
        
        selectionStyle = .none
        contentView.backgroundColor = .clear
        
        contentView.addSubview(backView)
        
        photoImageView.contentMode = .scaleAspectFit
        photoImageView.image = UIImage(named: "conference")
        contentView.addSubview(photoImageView)
        
        titleLabel.font = UIFont(name: "Helvetica-Light", size: 20)
        titleLabel.textColor = .black
        contentView.addSubview(titleLabel)
        
        msgLabel.font = UIFont(name: "Helvetica-Light", size: 20)
        msgLabel.textColor = .darkGray
        contentView.addSubview(msgLabel)
        
        backView.layer.cornerRadius = 2.5
        setTopBarShadow(view: backView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
