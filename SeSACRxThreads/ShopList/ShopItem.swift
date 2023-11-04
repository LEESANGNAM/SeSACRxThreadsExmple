//
//  ShopItem.swift
//  SeSACRxThreads
//
//  Created by 이상남 on 2023/11/04.
//

import Foundation


class shopItem {
    var ischecked: Bool
    var title: String
    var isStar: Bool
    
    init(ischecked: Bool, title: String, isStar: Bool) {
        self.ischecked = ischecked
        self.title = title
        self.isStar = isStar
    }
    
    convenience init(title: String) {
        self.init(ischecked: false, title: title, isStar: false)
    }
}
