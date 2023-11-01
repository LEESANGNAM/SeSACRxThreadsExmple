//
//  PhoneViewController.swift
//  SeSACRxThreads
//
//  Created by jack on 2023/10/30.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class PhoneViewController: UIViewController {
    
    let phoneTextField = SignTextField(placeholderText: "연락처를 입력해주세요")
    let nextButton = PointButton(title: "다음")
    let phone = PublishSubject<String>()
    let baseColor = BehaviorSubject(value: UIColor.systemRed)
    let buttonEnabled = BehaviorSubject(value: false)
    let disposebag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Color.white
        
        configureLayout()
        bind()
        nextButton.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
    }
    
    func bind(){
        
        phone
            .bind(to: phoneTextField.rx.text)
            .disposed(by: disposebag)
        
        phoneTextField.rx.text.orEmpty
            .subscribe(with: self) { owner, text in
                let resultText = text.formated(by: "###-####-####")
                owner.phone.onNext(resultText)
            }.disposed(by: disposebag)
        
        
        phone.map { $0.count > 12 }
            .subscribe(with: self) { owner, value in
                let color = value ? UIColor.systemBlue : UIColor.systemRed
                owner.baseColor.onNext(color)
//                owner.nextButton.isEnabled = value
                owner.buttonEnabled.onNext(value)
            }.disposed(by: disposebag)
        
        buttonEnabled
            .bind(to: nextButton.rx.isEnabled)
            .disposed(by: disposebag)
        
        baseColor
            .bind(to: nextButton.rx.backgroundColor, phoneTextField.rx.tintColor)
            .disposed(by: disposebag)
        
        baseColor
            .map { $0.cgColor }
            .bind(to: phoneTextField.layer.rx.borderColor)
            .disposed(by: disposebag)
        
    }
    
    @objc func nextButtonClicked() {
        navigationController?.pushViewController(NicknameViewController(), animated: true)
    }
    
    
    func configureLayout() {
        view.addSubview(phoneTextField)
        view.addSubview(nextButton)
        
        phoneTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(200)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        nextButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(phoneTextField.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
    
}
