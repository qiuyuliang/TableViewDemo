//
//  UserInfoCell.swift
//  TableViewDemo
//
//  Created by 邱育良 on 2018/1/19.
//  Copyright © 2018年 www.qiuyuliang.com. All rights reserved.
//

import UIKit

class UserInfoCell: TableViewCell {

    lazy var portrait: UIImageView = {
        let portrait = UIImageView()
        portrait.backgroundColor = UIColor.lightGray
        portrait.layer.cornerRadius = 4
        portrait.layer.masksToBounds = true
        return portrait
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.backgroundColor = .clear
        
        return nameLabel
    }()
    
    lazy var codeLabel: UILabel = {
        let codeLabel = UILabel()
        codeLabel.backgroundColor = .clear
        codeLabel.font = UIFont.systemFont(ofSize: 14)
        return codeLabel
    }()
    
    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(portrait)
        contentView.addSubview(nameLabel)
        contentView.addSubview(codeLabel)
        
        self.accessoryType = .disclosureIndicator
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        portrait.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        codeLabel.translatesAutoresizingMaskIntoConstraints = false

        portrait.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        portrait.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        portrait.widthAnchor.constraint(equalToConstant: 64).isActive = true
        portrait.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: portrait.topAnchor, constant: 5).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: portrait.rightAnchor, constant: 15).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
        
        codeLabel.bottomAnchor.constraint(equalTo: portrait.bottomAnchor, constant: -5).isActive = true
        codeLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        codeLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
    }
    
    
    // MARK: - Override
    override func cellWillAppear() {
        let userInfoRow = tableViewRow! as! UserInfoRow
        
        nameLabel.text = userInfoRow.text
        codeLabel.text = userInfoRow.detailText
    }
    
}
