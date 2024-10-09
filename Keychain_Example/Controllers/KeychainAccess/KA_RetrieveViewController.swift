//
//  KA_RetrieveViewController.swift
//  Keychain_Example
//
//  Created by 이수현 on 10/9/24.
//

import UIKit
import KeychainAccess

class KA_RetrieveViewController: UIViewController {

    let retrieveView = RetrieveView()
    private let keychain = Keychain(service : "login")

    override func viewWillAppear(_ animated: Bool) {
        initTextField()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveView.lblTitle.text = "Keychain 검색 (라이브러리)"
        self.view = retrieveView
        
        // 검색 버튼 구현
        retrieveView.btnRetrieve.addTarget(self, action: #selector(btnRetrieveDidTap), for: .touchUpInside)
    }
    
    @objc func btnRetrieveDidTap() {
        if let id = retrieveView.txtId.text {
            do {
                let password = try keychain.get(id) ?? ""
                print("password: \(password)")
                retrieveView.txtRetrievePwd.text = password
            } catch let error {
                print("error: \(error)")
                retrieveView.txtRetrievePwd.text = "검색 결과 없습니다."
            }
        }
    }
    
    // 텍스트 필드 초기화
    private func initTextField() {
        retrieveView.txtId.text = ""
        retrieveView.txtRetrievePwd.text = "검색 전입니다."
    }
}
