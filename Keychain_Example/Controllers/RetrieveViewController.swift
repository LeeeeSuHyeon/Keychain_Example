//
//  RetrieveViewController.swift
//  Keychain_Example
//
//  Created by 이수현 on 10/8/24.
//

import UIKit

class RetrieveViewController: UIViewController {
    let retrieveView = RetrieveView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = retrieveView
        
        // 검색 버튼 구현
    }
    

}
