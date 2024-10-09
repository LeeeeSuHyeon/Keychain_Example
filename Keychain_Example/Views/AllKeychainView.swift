//
//  AllKeychainView.swift
//  Keychain_Example
//
//  Created by 이수현 on 10/9/24.
//

import UIKit

class AllKeychainView: UIView {
    public lazy var lblTitle = UILabel().then { lbl in
        lbl.text = "등록된 Keychain"
        lbl.font = .systemFont(ofSize: 28, weight: .bold)
        lbl.textColor = .black
    }
    
    public lazy var lblCount = UILabel().then { lbl in
        lbl.text = "전체 0개"
        lbl.font = .systemFont(ofSize: 16)
        lbl.textColor = .systemGray
    }
    
    public lazy var tableView = UITableView().then { view in
        view.register(KeychainCell.self, forCellReuseIdentifier: KeychainCell.identifier)   // 셀 등록
        view.separatorStyle = .singleLine   // 구분선
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        self.addSubview(lblTitle)
        self.addSubview(lblCount)
        self.addSubview(tableView)
        
        lblTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(70)
        }
        
        lblCount.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(lblTitle.snp.bottom).offset(30)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(lblCount.snp.bottom).offset(30)
            make.leading.trailing.bottom.equalToSuperview()
            
        }
    }
}

