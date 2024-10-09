//
//  KeychainCell.swift
//  Keychain_Example
//
//  Created by 이수현 on 10/9/24.
//

import UIKit

class KeychainCell: UITableViewCell {
    static let identifier = "KeychainCell"
    
    private lazy var imgView = UIImageView().then { view in
        view.image = UIImage(systemName: "key")
        view.tintColor = .black
        view.contentMode = .scaleAspectFit
        
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
    }
    
    public lazy var lblId = UILabel().then { lbl in
        lbl.font = .systemFont(ofSize: 16, weight: .bold)
        lbl.textColor = .black
    }
    
    public lazy var lblPwd = UILabel().then { lbl in
        lbl.font = .systemFont(ofSize: 16, weight: .bold)
        lbl.textColor = .black
    }
    
    private lazy var grpLogin = UIStackView().then { view in
        view.axis = .vertical
        view.alignment = .leading
        view.spacing = 10
    }
    
    private lazy var grpAll = UIStackView().then { view in
        view.axis = .horizontal
        view.alignment = .center
        view.spacing = 20
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStackView()
        setUI()
    }
    

    private func setStackView() {
        grpLogin.addArrangedSubview(lblId)
        grpLogin.addArrangedSubview(lblPwd)
        
        grpAll.addArrangedSubview(imgView)
        grpAll.addArrangedSubview(grpLogin)
    }
    
    private func setUI() {
        self.addSubview(grpAll)
        
        imgView.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }

        grpAll.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    public func config(model : KeychainModel) {
        lblId.text = "ID : \(model.email)"
        lblPwd.text = "Password : \(model.password)"
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // 레이아웃이 설정된 후에 cornerRadius 설정
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 원형 이미지뷰로 만들기
        imgView.layer.cornerRadius = imgView.frame.width / 2
    }
    

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
