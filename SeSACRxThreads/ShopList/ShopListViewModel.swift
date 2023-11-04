//
//  ShopListViewModel.swift
//  SeSACRxThreads
//
//  Created by 이상남 on 2023/11/04.
//

import Foundation
import RxSwift

class ShopListViewModel {
    
    var shopListData:[shopItem] = []
    
    lazy var shopList = BehaviorSubject(value: shopListData)
    
    
    func appendshopItemData(title: String){
        let item = shopItem(title: title)
        shopListData.append(item)
    }
    
    func toggleCheck(index: Int) {
        let updatedItems = shopListData
        updatedItems[index].ischecked.toggle()
        shopList.onNext(updatedItems)
    }
    
    func toggleStar(index: Int) {
        let updatedItems = shopListData
        updatedItems[index].isStar.toggle()
        shopList.onNext(updatedItems)
    }
    
}
