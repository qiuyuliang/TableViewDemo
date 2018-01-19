/*
 File: TableViewSection.swift
 Abstract: section模型,用于存储row模型
 Version: 1.0
 Created By: 邱 育良
 Copyright (C) 2018 Qiu Yuliang. All Rights Reserved.
 
 */

import UIKit

class TableViewSection: NSObject {
    
    var rows = [TableViewRow]()
    
    /// 向section模型中添加row模型
    ///
    /// - Parameter row: row模型
    public func addRow(_ row: TableViewRow) {
        rows.append(row)
    }

}
