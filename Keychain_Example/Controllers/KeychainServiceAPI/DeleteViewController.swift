//
//  DeleteViewController.swift
//  Keychain_Example
//
//  Created by 이수현 on 10/8/24.
//

import UIKit

class DeleteViewController: UIViewController {
    let deleteView = DeleteView()
    
    override func viewWillAppear(_ animated: Bool) {
        initTextField()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = deleteView
        deleteView.btnDelete.addTarget(self, action: #selector(btnDeleteDidTap), for: .touchUpInside)
    }
    
    @objc func btnDeleteDidTap() {
        if let id = deleteView.txtId.text {
            let check = KeychainService.shared.delete(account: id)
            
            // 실패 했다면
            if check != errSecSuccess {
                print("DeleteViewController - 키체인 삭제 실패")
                deleteView.lblDelete.text = "키체인 삭제 실패했습니다."
            } else {
                deleteView.lblDelete.text = "키체인 삭제이 삭제되었습니다. (id : \(id))"
            }
        }
    }
    
    // 텍스트 필드 초기화
    private func initTextField() {
        deleteView.txtId.text = ""
        deleteView.lblDelete.text = "삭제하기 전 입니다."
    }
    
}
