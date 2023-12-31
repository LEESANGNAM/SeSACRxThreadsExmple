//
//  ShopListTableViewCell.swift
//  SeSACRxThreads
//
//  Created by 이상남 on 2023/11/04.
//

import UIKit
import SnapKit
import RxSwift

class ShopListTableViewCell: UITableViewCell {
    
    
    var checkButton = UIButton()
    var starButton = UIButton()
    var shopTitleLabel = UILabel()
    
    var disposebag = DisposeBag()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        print(#function)
        disposebag = DisposeBag()
    }
    
    func setUpData(item: shopItem){
        setStarButtonImage(item: item)
        setCheckButtonImage(item: item)
        shopTitleLabel.text = item.title
    }
    
    private func setCheckButtonImage(item: shopItem){
        if item.ischecked {
            checkButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        } else {
            checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
    }
    private func setStarButtonImage(item: shopItem){
        if item.isStar {
            starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }else {
            starButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    
    
    private func setHierarchy() {
        contentView.addSubview(checkButton)
        contentView.addSubview(shopTitleLabel)
        contentView.addSubview(starButton)
    }
    
    private func setConstraints(){
        setCheckButton()
        setShopTitleLabel()
        setStarButton()
    }
    
    private func setCheckButton(){
//        checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        checkButton.tintColor = .black
        checkButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.size.equalTo(40)
        }
        
    }
    private func setShopTitleLabel() {
//        shopTitleLabel.text = "테스트트트트트"
        
        shopTitleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(checkButton.snp.trailing).offset(20)
        }
    }
    
    private func setStarButton(){
//        starButton.setImage(UIImage(systemName: "star"), for: .normal)
        starButton.tintColor = .black
        starButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalTo(shopTitleLabel.snp.trailing).offset(20)
            make.centerY.equalToSuperview()
            make.size.equalTo(40)
        }
    }
    
    
    
}
