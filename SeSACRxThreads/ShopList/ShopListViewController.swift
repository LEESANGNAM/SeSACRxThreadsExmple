//
//  ShopListViewController.swift
//  SeSACRxThreads
//
//  Created by 이상남 on 2023/11/03.
//

import UIKit
import RxSwift
import RxCocoa

class ShopListViewController: UIViewController {
    
    let mainView = ShopListView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "쇼핑"
        
    }
    
}
