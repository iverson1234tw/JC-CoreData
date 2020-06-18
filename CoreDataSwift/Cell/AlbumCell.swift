//
//  AlbumCell.swift
//  CoreDataSwift
//
//  Created by iverson1234tw on 2020/6/18.
//  Copyright © 2020 josh.chen. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    var backView = UIView()
    var photoImageView = UIImageView()
    var titleLabel = UILabel()
    var msgLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initialize()
        
    }
    
    func initialize() -> Void {
        
        selectionStyle = .none
        contentView.backgroundColor = .clear
        
        backView.frame = CGRect(x: 0, y: 0, width: AppWidth, height: 120)
        contentView.addSubview(backView)
        
        photoImageView.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        photoImageView.contentMode = .scaleAspectFit
        contentView.addSubview(photoImageView)
        
        titleLabel.frame = CGRect(x: photoImageView.frame.origin.x + photoImageView.frame.size.width + 10, y: photoImageView.frame.origin.y, width: backView.frame.size.width - photoImageView.frame.size.width - 30, height: (backView.frame.size.height - 30)/2)
        titleLabel.font = UIFont(name: "Helvetica-Light", size: 25)
        titleLabel.textColor = .black
        contentView.addSubview(titleLabel)
        
        msgLabel.frame = CGRect(x: titleLabel.frame.origin.x, y: titleLabel.frame.origin.y + titleLabel.frame.size.height + 10, width: titleLabel.frame.size.width, height: titleLabel.frame.size.height)
        msgLabel.font = UIFont(name: "Helvetica-Light", size: 20)
        msgLabel.textColor = .darkGray
        contentView.addSubview(msgLabel)
        
        backView.layer.cornerRadius = 2.5
        setTopBarShadow(view: backView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
