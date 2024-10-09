//
//  MainView.swift
//  Keychain_Example
//
//  Created by 이수현 on 10/9/24.
//

import UIKit
import SnapKit

class MainView: UIView {
    private lazy var lblTitle = UILabel().then { lbl in
        lbl.text = "Keychain Example"
        lbl.font = .systemFont(ofSize: 32, weight: .bold)
        lbl.textColor = .black
    }
    
    public lazy var btnKeychainService = UIButton().then { btn in
        btn.setTitle("API 이용", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        btn.backgroundColor = .systemGray5
        
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.black.cgColor
    }
    
    public lazy var btnLibrary = UIButton().then { btn in
        btn.setTitle("라이브러리 이용", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .systemGray5
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.black.cgColor
    }
    
    private lazy var grpBtn = UIStackView().then { view in
        view.axis = .vertical
        view.spacing = 20
        view.alignment = .center
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStackView()
        setUI()
    }
    
    private func setStackView(){
        grpBtn.addArrangedSubview(btnKeychainService)
        grpBtn.addArrangedSubview(btnLibrary)
    }
    
    private func setUI() {
        self.addSubview(lblTitle)
        self.addSubview(grpBtn)
        
        self.backgroundColor = .white
        
        lblTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20) 
        }
        btnLibrary.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(80)
        }
        btnKeychainService.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(80)
        }
        
        grpBtn.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
