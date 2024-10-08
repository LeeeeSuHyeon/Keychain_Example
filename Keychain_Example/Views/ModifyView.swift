//
//  Modify.swift
//  Keychain_Example
//
//  Created by 이수현 on 10/8/24.
//

import Foundation
import UIKit

class ModifyView : UIView {
    private lazy var lblTitle = UILabel().then { lbl in
        lbl.text = "Keychain 수정"
        lbl.font = .systemFont(ofSize: 32, weight: .bold)
        lbl.textColor = .black
    }
    
    private lazy var lbl = UILabel().then { lbl in
        lbl.text = "비밀번호를 변경 하고 싶은 이메일 입력해주세요"
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
    
    private lazy var lblNewPwd = UILabel().then { lbl in
        lbl.text = "새로운 비밀번호를 입력해주세요"
        lbl.font = .systemFont(ofSize: 16)
        lbl.textColor = .black
    }
    
    public lazy var txtNewPwd = UITextField().then { text in
        text.placeholder = "새로운 비밀번호 입력"
        text.layer.masksToBounds = true
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.systemGray2.cgColor
        text.layer.cornerRadius = 10
        
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        text.leftViewMode = .always
    }
    
    
    public lazy var lblModify = UILabel().then { lbl in
        lbl.text = "비밀번호 변경 전 입니다."
        lbl.font = .systemFont(ofSize: 16)
        lbl.textColor = .black
    }
    
    
    // 키체인 수정 버튼
    public lazy var btnModify = UIButton().then { btn in
        var config = UIButton.Configuration.plain()
        config.title = "키체인 수정"
        
        btn.configuration = config
        btn.tintColor = .black
        btn.backgroundColor = .systemGray4
        btn.layer.cornerRadius = 10
    }
    
    private lazy var grpModify = UIStackView().then { view in
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
        grpModify.addArrangedSubview(lbl)
        grpModify.addArrangedSubview(txtId)
        grpModify.addArrangedSubview(lblNewPwd)
        grpModify.addArrangedSubview(txtNewPwd)
        grpModify.addArrangedSubview(lblModify)

    }
    
    private func setUI(){
        self.addSubview(grpModify)
        self.addSubview(btnModify)
        self.addSubview(lblTitle)
        
        lblTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(70)
        }

        txtId.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(30)
        }
        
        txtNewPwd.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(30)
        }
        
        grpModify.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.centerY.equalToSuperview()
        }
        
        btnModify.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(60)
            make.top.equalTo(grpModify.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
