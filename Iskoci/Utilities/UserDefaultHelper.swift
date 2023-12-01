//
//  UserDefoltHelper.swift
//  Iskoci
//
//  Created by kzmvranje on 20.11.23..
//

import Foundation
struct UserDefaultHelper{
    
    public enum Keys{
        case isRegister
        case userId 
        
        var value: String {
            switch self {
                
            case .isRegister:
                return "isRegister"
            case .userId:
                return "userId"
            }
        }
    }
    
    static var shared = UserDefaultHelper()
    
    private init() {}
    
    var userId: String {
        get {
            UserDefaults.standard.string(forKey: Keys.userId.value) ??  "18012001"
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: Keys.userId.value)
        }
    }
    var isRegister: Bool {
        get {
            UserDefaults.standard.bool(forKey: Keys.isRegister.value)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: Keys.isRegister.value)
        }
    }
}

