//
//  ViewController.swift
//  Keychain_Example
//
//  Created by 이수현 on 10/8/24.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let addVC = AddViewController()
    let deleteVC = DeleteViewController()
    let modifyVC = ModifyViewController()
    let retrieveVC = RetrieveViewController()
                                    
                                    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addVC.tabBarItem = UITabBarItem(title: "추가", image: UIImage(systemName: "plus.circle"), tag: 0)
        retrieveVC.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "plus.magnifyingglass"), tag: 1)
        modifyVC.tabBarItem = UITabBarItem(title: "수정", image: UIImage(systemName: "square.and.pencil.circle"), tag: 2)
        deleteVC.tabBarItem = UITabBarItem(title: "삭제", image: UIImage(systemName: "xmark.shield"), tag: 3)
        self.viewControllers = [addVC, retrieveVC, modifyVC, deleteVC]
    }


}

