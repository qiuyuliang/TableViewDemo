//
//  SimpleCell.swift
//  TableViewDemo
//
//  Created by 邱育良 on 2018/1/19.
//  Copyright © 2018年 www.qiuyuliang.com. All rights reserved.
//

import UIKit

class SimpleCell: TableViewCell {

    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.accessoryType = .disclosureIndicator
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func cellWillAppear() {
        let simpleRow = tableViewRow! as! SimpleRow

        textLabel?.text =  simpleRow.text
    }
}
