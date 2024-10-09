//
//  AllKeychainViewController.swift
//  Keychain_Example
//
//  Created by 이수현 on 10/9/24.
//

import UIKit

class AllKeychainViewController: UIViewController {
    private lazy var allView = AllKeychainView().then { view in
        view.tableView.delegate = self
        view.tableView.dataSource = self
        
        view.lblCount.text = "전체 \(keychains.count)개"
    }
    
    lazy var keychains : [KeychainModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = allView
    }
}

extension AllKeychainViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keychains.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: KeychainCell.identifier, for: indexPath) as? KeychainCell else {
            return UITableViewCell()
        }
     
        cell.config(model: keychains[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
