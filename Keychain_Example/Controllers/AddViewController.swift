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
    }

}
