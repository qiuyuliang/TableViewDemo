/*
 File: TableViewCell.swift
 Abstract: 自定义cell的基类
 Version: 1.0
 Created By: 邱 育良
 Copyright (C) 2018 Qiu Yuliang. All Rights Reserved.
 
 */

import UIKit

class TableViewCell: UITableViewCell {

    /// 数据模型
    var tableViewRow: TableViewRow?
    
    /// 每次刷新cell的时候调用,会多次调用，子类需重写
    func cellWillAppear() {
        
    }
    
}
