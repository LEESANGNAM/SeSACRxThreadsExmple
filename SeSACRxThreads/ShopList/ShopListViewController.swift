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
    
    let viewmodel = ShopListViewModel()
    
    let disposebag = DisposeBag()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bine()
        title = "쇼핑"
    }
    
    private func bine(){
        
        viewmodel.shopList
            .bind(to: mainView.shopListTableView.rx.items(cellIdentifier: ShopListTableViewCell.identifier, cellType: ShopListTableViewCell.self)){(row, element, cell) in
                cell.shopTitleLabel.text = element + "\(row)번째"
            }.disposed(by: disposebag)
        
        mainView.addButton.rx.tap
            .withLatestFrom(mainView.headerTextField.rx.text.orEmpty)
            .subscribe(with: self) { owner, value in
                owner.viewmodel.shopListData.append(value)
                owner.viewmodel.shopList.onNext(owner.viewmodel.shopListData)
                owner.mainView.headerTextField.text = ""
            }.disposed(by: disposebag)
            
        mainView.headerTextField.rx.controlEvent(.editingDidEndOnExit)
            .withLatestFrom(mainView.headerTextField.rx.text.orEmpty)
            .subscribe(with: self) { owner, value in
                owner.viewmodel.shopListData.append(value)
                owner.viewmodel.shopList.onNext(owner.viewmodel.shopListData)
                owner.mainView.headerTextField.text = ""
            }.disposed(by: disposebag)
        
    }

    
}
