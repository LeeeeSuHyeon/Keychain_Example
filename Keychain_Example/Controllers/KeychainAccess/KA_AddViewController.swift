//
//  KA_AddViewController.swift
//  Keychain_Example
//
//  Created by 이수현 on 10/9/24.
//

import UIKit
import KeychainAccess

class KA_AddViewController: UIViewController {
    private lazy var addView = AddView()
    private let keychain = Keychain(service: "login")
    
    override func viewWillAppear(_ animated: Bool) {
        initTextField(checkText: "키체인 등록 전입니다.")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = addView
        
        // addView의 버튼 액션 설정
        addView.btnLogin.addTarget(self, action: #selector(btnLoginDidTap), for: .touchUpInside)
    }

    @objc func btnLoginDidTap(){
        if let id = addView.txtId.text, let pwd = addView.txtPwd.text {
            
            // 키체인 등록
            do {
                try keychain.set(pwd, key: id)
            } catch let error {
                print("error: \(error)")
            }
            
            print("AddViewController - Keychain 등록(id : \(id), pwd : \(pwd))")
            initTextField(checkText: "키체인 등록 완료")

        }
    }

    // 텍스트 필드 초기화
    private func initTextField(checkText : String) {
        addView.txtId.text = ""
        addView.txtPwd.text = ""
        addView.lblCheck.text = checkText
    }
}
