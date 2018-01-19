/*
 File: TableViewRow.swift
 Abstract: TableViewCell对应的数据模型
 Version: 1.0
 Created By: 邱 育良
 Copyright (C) 2018 Qiu Yuliang. All Rights Reserved.
 
 */

import UIKit

typealias DidSelectRowAtIndexPath = (TableViewRow, IndexPath) -> Void

class TableViewRow: NSObject {
    
    /// 复用标识
    var reuseIdentifier: String = "Cell"
    
    /// 行高
    var rowHeight: CGFloat = UITableViewAutomaticDimension
    
    /// 默认有选中效果
    var selectionStyle: UITableViewCellSelectionStyle = .default
    
    /// 点击cell回调
    var didSelectRowAtIndexPath: DidSelectRowAtIndexPath?
    
    /// 模型携带信息
    var userInfo: [String : String]?
    
    /// 便利构造器
    ///
    /// - Parameters:
    ///   - reuseIdentifier: 复用标识
    ///   - rowHeight: 行高
    convenience init(reuseIdentifier: String = "Cell", rowHeight: CGFloat = 44.0) {
        self.init()
        
        self.reuseIdentifier = reuseIdentifier
        self.rowHeight = rowHeight
    }
}
