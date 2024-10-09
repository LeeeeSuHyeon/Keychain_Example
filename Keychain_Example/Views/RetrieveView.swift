//
//  RetrieveView.swift
//  Keychain_Example
//
//  Created by 이수현 on 10/8/24.
//

import Foundation
import UIKit

class RetrieveView : UIView {
    public lazy var lblTitle = UILabel().then { lbl in
        lbl.text = "Keychain 검색"
        lbl.font = .systemFont(ofSize: 28, weight: .bold)
        lbl.textColor = .black
    }
    
    private lazy var lbl = UILabel().then { lbl in
        lbl.text = "비밀번호를 찾고 싶은 이메일 입력해주세요"
        lbl.font = .systemFont(ofSize: 16)
        lbl.textColor = .black
    }
    
    public lazy var txtId = UITextField().then { text in
        text.placeholder = "이메일 입력"
        text.layer.masksToBounds = true
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.systemGray2.cgColor
        text.layer.cornerRadius = 10
        
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        text.leftViewMode = .always
    }
    
    
    private lazy var lblRetrieve = UILabel().then { lbl in
        lbl.text = "검색된 비밀번호 입니다."
        lbl.font = .systemFont(ofSize: 16)
        lbl.textColor = .black
    }
    
    public lazy var txtRetrievePwd = UITextField().then { text in
        text.text = "검색 전입니다."
        text.layer.masksToBounds = true
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.systemGray2.cgColor
        text.layer.cornerRadius = 10
        
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        text.leftViewMode = .always
        text.isUserInteractionEnabled = false

    }
    
    // 키체인 검색 버튼
    public lazy var btnRetrieve = UIButton().then { btn in
        var config = UIButton.Configuration.plain()
        config.title = "키체인 검색"
        
        btn.configuration = config
        btn.tintColor = .black
        btn.backgroundColor = .systemGray4
        btn.layer.cornerRadius = 10
    }
    
    private lazy var grpRetrieve = UIStackView().then { view in
        view.axis = .vertical
        view.spacing = 10
        view.alignment = .leading
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStackView()
        setUI()
    }
    
    private func setStackView(){
        grpRetrieve.addArrangedSubview(lbl)
        grpRetrieve.addArrangedSubview(txtId)
        grpRetrieve.addArrangedSubview(lblRetrieve)
        grpRetrieve.addArrangedSubview(txtRetrievePwd)
    }
    
    private func setUI(){
        self.addSubview(grpRetrieve)
        self.addSubview(btnRetrieve)
        self.addSubview(lblTitle)
        
        lblTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(70)
        }
        
        txtRetrievePwd.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(30)
        }
        
        txtId.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(30)
        }
        
        grpRetrieve.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.centerY.equalToSuperview()
        }
        
        btnRetrieve.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(60)
            make.top.equalTo(grpRetrieve.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
