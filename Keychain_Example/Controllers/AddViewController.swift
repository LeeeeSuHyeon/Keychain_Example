//
//  AddViewController.swift
//  Keychain_Example
//
//  Created by 이수현 on 10/8/24.
//

import UIKit

class AddViewController: UIViewController {
    private lazy var addView = AddView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = addView
        
        // addView의 버튼 액션 설정
        addView.btnLogin.addTarget(self, action: #selector(btnLoginDidTap), for: .touchUpInside)
    }

    @objc func btnLoginDidTap(){
        if let id = addView.txtId.text, let pwd = addView.txtPwd.text {
            
            // 키체인 등록
            KeychainService.shared.save(account: id, password: pwd)
            print("AddViewController - Keychain 등록(id : \(id), pwd : \(pwd))")
            
            // 텍스트 필드 초기화
            addView.txtId.text = ""
            addView.txtPwd.text = ""
            
            addView.lblCheck.text = "키체인 등록 완료"
        }
    }
}
