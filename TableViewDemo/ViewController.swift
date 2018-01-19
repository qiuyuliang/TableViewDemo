//
//  ViewController.swift
//  TableViewDemo
//
//  Created by 邱育良 on 2018/1/18.
//  Copyright © 2018年 www.qiuyuliang.com. All rights reserved.
//

import UIKit

class ViewController: TableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 注册两种样式的cell
        tableView.register(UserInfoCell.classForCoder(), forCellReuseIdentifier: "UserInfo")
        tableView.register(SimpleCell.classForCoder(), forCellReuseIdentifier: "Simple")

        //添加section
        addSection { (section) in
            let userInfoRow = UserInfoRow(reuseIdentifier: "UserInfo", rowHeight: 100)
            userInfoRow.selectionStyle = .none
            userInfoRow.text = "姓名"
            userInfoRow.detailText = "微信名"
            userInfoRow.didSelectRowAtIndexPath = {(row, indexPath) in
                print("被点击")
            }
            section.addRow(userInfoRow);
            
            let simpleRow = SimpleRow(reuseIdentifier: "Simple")
            simpleRow.text = "Watch微信"
            section.addRow(simpleRow);
        }
        
        addSection {
            let wallet = SimpleRow(reuseIdentifier: "Simple")
            wallet.text = "钱包"
            $0.addRow(wallet)
        }
        
        addSection {
            let favorites = SimpleRow(reuseIdentifier: "Simple")
            favorites.text = "收藏"
            $0.addRow(favorites)
            
            let myPosts = SimpleRow(reuseIdentifier: "Simple")
            myPosts.text = "相册"
            $0.addRow(myPosts)
            
            let cardsAndOffers = SimpleRow(reuseIdentifier: "Simple")
            cardsAndOffers.text = "卡包"
            $0.addRow(cardsAndOffers)
            
            let stickerGallery = SimpleRow(reuseIdentifier: "Simple")
            stickerGallery.text = "表情"
            $0.addRow(stickerGallery)
        }
        
        addSection {
            let settings = SimpleRow(reuseIdentifier: "Simple")
            settings.text = "设置"
            $0.addRow(settings)
        }
        
        tableView.reloadData()
    }

}

extension ViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
