//
//  KeychainService.swift
//  Keychain_Example
//
//  Created by 이수현 on 10/8/24.
//

import Foundation
import Security

class KeychainService {

    // 단일 인스턴스만 보장 (싱글톤 패턴)
    static let shared = KeychainService()
    
    // 생성자를 private으로 설정하여 외부에서 새로운 인스턴스를 생성하지 못하게 함
    private init() {}
    
    // Keychain에 데이터를 저장하는 함수
    @discardableResult  // 반환 값 사용에 대한 경고 무시 (반환 된 OSStatus 값을 사용하지 않아도 경고가 뜨지 않음)
    func save(account: String, service: String = "login", password: String) -> OSStatus {
        let passwordData = password.data(using: .utf8)!  // 저장할 데이터: 문자열을 Data로 변환
        
        // 저장할 데이터와 속성을 포함한 쿼리 구성
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,  // 비밀번호 저장
            kSecAttrAccount as String: account,             // 계정 이름
            kSecAttrService as String: service,             // 서비스 이름
            kSecValueData as String: passwordData           // 실제 비밀번호 데이터
        ]
        
        // 기존 항목이(같은 키) 있으면 삭제
        SecItemDelete(query as CFDictionary)
        
        // 새로운 데이터 저장
        return SecItemAdd(query as CFDictionary, nil)
    }
    
    // Keychain에서 데이터를 불러오는 함수
    func load(account: String, service: String = "login") -> String? {
            // 검색할 속성 정의
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,  // 비밀번호 클래스 사용
            kSecAttrAccount as String: account,             // 계정 이름
            kSecAttrService as String: service,             // 서비스 이름
            kSecReturnData as String: true,                 // 데이터를 반환하도록 설정
       //   kSecReturnData as String: kCFBooleanTrue!,      // 데이터를 반환하도록 설정
            kSecMatchLimit as String: kSecMatchLimitOne     // 하나의 결과만 반환
        ]
        
        var item: CFTypeRef?
        // var item : AnyObject? = nil
        
        // 데이터 검색
        let status : OSStatus = SecItemCopyMatching(query as CFDictionary, &item)
        
        // 검색의 성공, 실패 확인 -> 실패면 return nil
        guard status == errSecSuccess else { return nil }
        
        if let data = item as? Data, let password = String(data: data, encoding: .utf8) {
            return password
        }
        
        return nil
    }
    
    // Keychain에서 데이터를 업데이트하는 함수
    @discardableResult
    func update(account: String, service: String = "login", newPassword: String) -> OSStatus {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrService as String: service
        ]
        
        let attributesToUpdate: [String: Any] = [
            kSecValueData as String: newPassword.data(using: .utf8)!
        ]
        
        return SecItemUpdate(query as CFDictionary, attributesToUpdate as CFDictionary)
    }
    
    // Keychain에서 데이터를 삭제하는 함수
    @discardableResult
    func delete(account: String, service: String) -> OSStatus {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,  // 비밀번호 클래스 사용
            kSecAttrAccount as String: account,             // 계정 이름
            kSecAttrService as String: service              // 서비스 이름
        ]
        
        // 해당하는 Keychain Item 삭제
        return SecItemDelete(query as CFDictionary)
    }
}
