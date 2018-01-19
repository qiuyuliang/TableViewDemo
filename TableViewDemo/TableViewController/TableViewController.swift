/*
 File: TableViewController.swift
 Abstract: 自定义cell的基类
 Version: 1.0
 Created By: 邱 育良
 Copyright (C) 2018 Qiu Yuliang. All Rights Reserved.
 
 */


import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /// 存储所有的section数组
    lazy var sections: [TableViewSection] = {
        let section = [TableViewSection]()
        return section
    }()
    
    lazy var tableView : UITableView = {
        let tableView = UITableView(frame: self.view.bounds, style: .grouped)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        return tableView
    }()

    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(tableView)
    }

    /// 方便子类添加section,免去section的初始化
    ///
    /// - Parameter handle: 添加row模型
    /// - Returns: section模型
    @discardableResult public func addSection(_ handle: (_ section: TableViewSection) -> Void) -> TableViewSection {
        let section = TableViewSection()
        handle(section)
        sections.append(section)
        return section
    }

}


// MARK: - UITableViewDataSource

extension TableViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = self.sections[section]
        return section.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = sections[indexPath.section]
        let row = section.rows[indexPath.row]
        
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: row.reuseIdentifier, for: indexPath) as! TableViewCell
        tableViewCell.selectionStyle = row.selectionStyle
        tableViewCell.tableViewRow = row
        
        tableViewCell.cellWillAppear()
        return tableViewCell
    }
}


// MARK: - UITableViewDelegate

extension TableViewController {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = sections[indexPath.section]
        let row = section.rows[indexPath.row]
        
        return row.rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = sections[indexPath.section]
        let row = section.rows[indexPath.row]
        
        if row.didSelectRowAtIndexPath != nil {
            row.didSelectRowAtIndexPath!(row, indexPath)
        }
    }
}
