//
//  KA_DeleteViewController.swift
//  Keychain_Example
//
//  Created by 이수현 on 10/9/24.
//

import UIKit
import KeychainAccess

class KA_DeleteViewController: UIViewController {

    let deleteView = DeleteView()
    private let keychain = Keychain(service: "login")
    
    override func viewWillAppear(_ animated: Bool) {
        initTextField()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        deleteView.lblTitle.text = "Keychain 삭제 (라이브러리)"
        self.view = deleteView
        deleteView.btnDelete.addTarget(self, action: #selector(btnDeleteDidTap), for: .touchUpInside)
    }
    
    @objc func btnDeleteDidTap() {
        if let id = deleteView.txtId.text {
            
            do {
                try keychain.remove(id)
                deleteView.lblDelete.text = "키체인 삭제이 삭제되었습니다. (id : \(id))"
            } catch let error {
                print("error: \(error)")
                print("DeleteViewController - 키체인 삭제 실패")
                deleteView.lblDelete.text = "키체인 삭제 실패했습니다."
            }
        }
    }
    
    // 텍스트 필드 초기화
    private func initTextField() {
        deleteView.txtId.text = ""
        deleteView.lblDelete.text = "삭제하기 전 입니다."
    }

}
