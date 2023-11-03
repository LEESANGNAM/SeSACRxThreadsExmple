//
//  ShopListViewModel.swift
//  SeSACRxThreads
//
//  Created by 이상남 on 2023/11/04.
//

import Foundation
import RxSwift

class ShopListViewModel {
    
    var shopListData = ["tt","aa","bb","cc","dd","ee","qq","ee","rr","tt","aa"]
    
    lazy var shopList = BehaviorSubject(value: shopListData)
    
    
    
    
}
