//
//  RetrieveViewController.swift
//  Keychain_Example
//
//  Created by 이수현 on 10/8/24.
//

import UIKit

class RetrieveViewController: UIViewController {
    let retrieveView = RetrieveView()

    override func viewWillAppear(_ animated: Bool) {
        initTextField()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = retrieveView
        
        // 검색 버튼 구현
        retrieveView.btnRetrieve.addTarget(self, action: #selector(btnRetrieveDidTap), for: .touchUpInside)
    }
    
    @objc func btnRetrieveDidTap() {
        if let id = retrieveView.txtId.text, let password = KeychainService.shared.load(account: id){
            retrieveView.txtRetrievePwd.text = password
        } else {
            retrieveView.txtRetrievePwd.text = "검색 결과 없습니다."
        }
    }
    
    // 텍스트 필드 초기화
    private func initTextField() {
        retrieveView.txtId.text = ""
        retrieveView.txtRetrievePwd.text = "검색 전입니다."
    }
    

}
