//
//  KA_ModifyViewController.swift
//  Keychain_Example
//
//  Created by 이수현 on 10/9/24.
//

import UIKit
import KeychainAccess

class KA_ModifyViewController: UIViewController {

    let modifyView = ModifyView()
    private let keychain = Keychain(service: "login")
    
    override func viewWillAppear(_ animated: Bool) {
        initTextField()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        modifyView.lblTitle.text = "Keychain 수정 (라이브러리)"
        self.view = modifyView
        
        modifyView.btnModify.addTarget(self, action: #selector(btnModifyDidTap), for: .touchUpInside)
    }
    
    @objc func btnModifyDidTap() {
        if let id = modifyView.txtId.text, let newPwd = modifyView.txtNewPwd.text {
            
            do {
                try keychain.set(newPwd, key: id)
                print("ModifyViewController - update 성공")
                print("id : \(id), newPassword : \(newPwd)")
                modifyView.lblModify.text = "변경 성공! - id : \(id), newPassword : \(newPwd)"
            }
            catch let error {
                print("error : \(error)")
                print("ModifyViewController - update 실패")
                modifyView.lblModify.text = "비밀번호 변경 실패"
            }
        }
    }
    
    // 텍스트 필드 초기화
    private func initTextField() {
        modifyView.txtId.text = ""
        modifyView.txtNewPwd.text = ""
        modifyView.lblModify.text = "비밀번호 변경 전 입니다."
    }

}
