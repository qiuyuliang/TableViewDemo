# TableViewDemo
数据驱动的方式来创建tableView


### 复杂tableView的常规使用可能有什么问题

- 实际的开发中，tableView的行数(或者section数)往往是动态的，可能受一些权限控制，或是暂时没获取到数据，这就避免不了很多的判断语句。
- 试想如果有若干个不同样式的cell，当需要向某一行添加一个新的cell将是多么可怕，由于tableView的某一个indexPath显示什么基本都是硬编码的，而且tableView的代理方法那么多，改动之大可想而知，而且一不小心往往会导致诸如数组越界的崩溃。

### TableViewController的使用

```swift
class ViewController: TableViewController {

}
```

- 注册cell
```swift
tableView.register(UserInfoCell.classForCoder(), forCellReuseIdentifier: "UserInfo")
tableView.register(SimpleCell.classForCoder(), forCellReuseIdentifier: "Simple")
```

- 添加section和row
```swift
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
```

- section被add多少次意味着section数目有多少,可以通过添加if语句控制某个section要不要显示，row也是类似




