//
//  NicknameViewController.swift
//  SeSACRxThreads
//
//  Created by jack on 2023/10/30.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class NicknameViewController: UIViewController {
   
    let nicknameTextField = SignTextField(placeholderText: "닉네임을 입력해주세요")
    let nextButton = PointButton(title: "다음")
    let nicknameText = BehaviorSubject(value: "")
    let baseColor = BehaviorSubject(value: UIColor.systemOrange)
    let nickNameVaild = BehaviorSubject(value: false)
    let disposebag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Color.white
        
        configureLayout()
        bind()
        nextButton.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)

    }
    
    func bind(){
        // 1. 텍스트필드 값을 텍스트로 넘겨야함
        nicknameTextField.rx.text.orEmpty
            .subscribe(with: self) { owner, text in
                let removeSpaceText = text.trimmingCharacters(in: .whitespacesAndNewlines)
                owner.nicknameText.onNext(removeSpaceText) // 2. 텍스트필드값을 방출 ->
            }
        // 3. 여기서 방출받은값 받아서
        // 텍스트를 검사하고 bool 값으로 변경해서
        nicknameText.map { self.nicknameVaild(text: $0) }
            .subscribe(with: self) { owner, value in
                let color = value ? UIColor.systemGreen : UIColor.systemOrange
                owner.baseColor.onNext(color) // 4. 컬러를 방출 ->
                owner.nickNameVaild.onNext(value) //4. 조건검사값도 방출 ->
            }.disposed(by: disposebag)
        
        
        // 텍스트값이 바뀌면 텍스트필드에 보여주고
        nicknameText
            .bind(to: nicknameTextField.rx.text)
            .disposed(by: disposebag)
        // 조건을 검사해서 조건값을 버튼에 연결하고(통과못하면 클릭도 false)
        nickNameVaild
            .bind(to: nextButton.rx.isEnabled)
            .disposed(by: disposebag)
        // 컬러는 버튼의 배경과 연결하고
        baseColor
            .bind(to: nextButton.rx.backgroundColor)
            .disposed(by: disposebag)
        
    }
    
    func nicknameVaild(text: String) -> Bool{
        if text.isEmpty {
            print("빈칸")
            return false
        } else if text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            print("공백만 있음")
            return false
        } else if text.count < 3 || text.count > 6{
            print("닉네임을 3~6글자로 적어주세요")
            return false
        } else {
            print("통과~")
            return true
        }
    }
    
    @objc func nextButtonClicked() {
        navigationController?.pushViewController(BirthdayViewController(), animated: true)
    }

    
    func configureLayout() {
        view.addSubview(nicknameTextField)
        view.addSubview(nextButton)
         
        nicknameTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(200)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        nextButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(nicknameTextField.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }

}
