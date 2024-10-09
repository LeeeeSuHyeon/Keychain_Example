//
//  ModifyViewController.swift
//  Keychain_Example
//
//  Created by 이수현 on 10/8/24.
//

import UIKit

class ModifyViewController: UIViewController {
    let modifyView = ModifyView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = modifyView
        
        modifyView.btnModify.addTarget(self, action: #selector(btnModifyDidTap), for: .touchUpInside)
    }
    
    @objc func btnModifyDidTap() {
        if let id = modifyView.txtId.text, let newPwd = modifyView.txtNewPwd.text {
            let check = KeychainService.shared.update(account: id, newPassword: newPwd)
            
            if check != errSecSuccess {
                print("ModifyViewController - update 실패")
                modifyView.lblModify.text = "비밀번호 변경 실패"
            } else {
                print("ModifyViewController - update 성공")
                print("id : \(id), newPassword : \(newPwd)")
                modifyView.lblModify.text = "변경 성공! - id : \(id), newPassword : \(newPwd)"
                
                
            }
            
        }
    }

}
