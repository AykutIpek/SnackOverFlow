//
//  UserCacheItems.swift
//  SnackOverFlow
//
//  Created by aykut ipek on 8.06.2023.
//

import Foundation


enum UserCacheKeys: String {
    case onboard = "onboard"
    static let dummyValue = "save_onboard"
}

protocol UserCacheProtocol {
    func read(key: UserCacheKeys) -> String
    func save(key: UserCacheKeys, value: String)
    func remove(key: UserCacheKeys)
}


extension UserCacheProtocol{
    /// Read User Data
    /// - Parameter key: Cache Item Key
    /// - Returns: Cached value or empty
    func read(key: UserCacheKeys) -> String{
        guard let value = UserDefaults.standard.value(forKey: key.rawValue) as? String else { return "" }
        return value
    }
    /// Save user value to cache
    /// - Parameters:
    ///   - key: cache item key
    ///   - value: whatever user value as a string
    func save(key: UserCacheKeys, value: String){
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    /// Remove Cache Item
    /// - Parameter key: Cache Item Key
    func remove(key: UserCacheKeys){
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
}


struct UserDefaultCache: UserCacheProtocol {
    
}
