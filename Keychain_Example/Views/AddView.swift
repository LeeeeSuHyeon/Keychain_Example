//
//  KeychainView.swift
//  Keychain_Example
//
//  Created by 이수현 on 10/8/24.
//

import UIKit
import SnapKit
import Then

class AddView: UIView {
    private lazy var lblId = UILabel().then { lbl in
        lbl.text = "이메일을 입력해주세요"
        lbl.font = .systemFont(ofSize: 16)
        lbl.textColor = .black
    }
    public lazy var txtId = UITextField().then { text in
        text.placeholder = "email 입력"
        text.layer.masksToBounds = true
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.systemGray2.cgColor
        text.layer.cornerRadius = 10
        
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        text.leftViewMode = .always
    }
    
    private lazy var lblPwd = UILabel().then { lbl in
        lbl.text = "비밀번호를 입력해주세요"
        lbl.font = .systemFont(ofSize: 16)
        lbl.textColor = .black
    }
    public lazy var txtPwd = UITextField().then { text in
        text.placeholder = "password 입력"
        text.layer.masksToBounds = true
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.systemGray2.cgColor
        text.layer.cornerRadius = 10
        
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        text.leftViewMode = .always
    }
    
    private lazy var grpId = UIStackView().then { view in
        view.axis = .vertical
        view.spacing = 5
        view.alignment = .leading
    }
    
    private lazy var grpPwd = UIStackView().then { view in
        view.axis = .vertical
        view.spacing = 5
        view.alignment = .leading
    }
    
    private lazy var grpLogin = UIStackView().then { view in
        view.axis = .vertical
        view.spacing = 20
        view.alignment = .center
    }
    
    // 로그인 버튼 (키체인 추가)
    public lazy var btnLogin = UIButton().then { btn in
        var config = UIButton.Configuration.plain()
        config.title = "키체인 추가"
        
        btn.configuration = config
        btn.tintColor = .black
        btn.backgroundColor = .systemGray4
        btn.layer.cornerRadius = 10
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStackView()
        setUI()
    }
    
    private func setStackView(){
        grpId.addArrangedSubview(lblId)
        grpId.addArrangedSubview(txtId)
        
        grpPwd.addArrangedSubview(lblPwd)
        grpPwd.addArrangedSubview(txtPwd)
        
        grpLogin.addArrangedSubview(grpId)
        grpLogin.addArrangedSubview(grpPwd)
        grpLogin.addArrangedSubview(btnLogin)
    }
    
    private func setUI(){
        self.addSubview(grpLogin)
        
        txtId.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
        
        txtPwd.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
        
        btnLogin.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(60)
        }
        
        grpLogin.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    // 키체인 검색
    private lazy var btnRetrieve = UIButton().then { btn in
        var config = UIButton.Configuration.plain()
        config.title = "키체인 검색"
        config.baseBackgroundColor = .systemBlue
        
        btn.configuration = config
        btn.tintColor = .black
    }
    
    // 키체인 삭제
    private lazy var btnDelete = UIButton().then { btn in
        var config = UIButton.Configuration.plain()
        config.title = "키체인 삭제"
        config.baseBackgroundColor = .systemBlue
        
        btn.configuration = config
        btn.tintColor = .black
    }
    
    // 키체인 수정
    private lazy var btnModify = UIButton().then { btn in
        var config = UIButton.Configuration.plain()
        config.title = "키체인 수정"
        config.baseBackgroundColor = .systemBlue
        
        btn.configuration = config
        btn.tintColor = .black
    }
    
}
