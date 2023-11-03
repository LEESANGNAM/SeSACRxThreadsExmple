//
//  ShopListView.swift
//  SeSACRxThreads
//
//  Created by 이상남 on 2023/11/03.
//

import UIKit

class ShopListView: UIView {

    var headerView = UIView()
    var headerTextField = UITextField()
    var addButton = UIButton()
    var shopListTableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setHierarchy()
        setconstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setHierarchy(){
        headerView.addSubview(headerTextField)
        headerView.addSubview(addButton)
        addSubview(headerView)
        addSubview(shopListTableView)
    }
    
    private func setconstraints(){
        setHeaderView()
        setHeaderTextField()
        setAddButton()
        setShopListTableView()
    }
    
    private func setHeaderView(){
        headerView.backgroundColor = .systemGray6
        headerView.layer.cornerRadius = 10
        headerView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(10)
            make.top.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.height.equalTo(60)
        }
    }
    private func setHeaderTextField(){
        headerTextField.placeholder = "무엇을 구매하실건가요?"
        headerTextField.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(10)
            make.leading.equalToSuperview().offset(10)
        }
    }
    private func setAddButton(){
        addButton.setTitle("추가", for: .normal)
        addButton.setTitleColor(.label, for: .normal)
        addButton.backgroundColor = .systemGray4
        addButton.layer.cornerRadius = 5
        addButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(headerTextField.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.width.equalTo(60)
        }
    }
    private func setShopListTableView(){
        shopListTableView.backgroundColor = .systemBlue
        shopListTableView.rowHeight = 60
        shopListTableView.register(ShopListTableViewCell.self, forCellReuseIdentifier: ShopListTableViewCell.identifier)
        shopListTableView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(10)
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-5)
        }
    }
    
}
