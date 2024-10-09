//
//  MainViewController.swift
//  Keychain_Example
//
//  Created by 이수현 on 10/9/24.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainView = MainView()

    override func viewDidLoad() {
        self.view = mainView
        mainView.btnKeychainService.addTarget(self, action: #selector(btnKeychainServiceDidTap), for: .touchUpInside)
        
        mainView.btnLibrary.addTarget(self, action: #selector(btnLibraryDidTap), for: .touchUpInside)
    }
    
    @objc func btnKeychainServiceDidTap() {
        let vc = TabBarViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func btnLibraryDidTap() {
        let vc = KA_TabBarViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
