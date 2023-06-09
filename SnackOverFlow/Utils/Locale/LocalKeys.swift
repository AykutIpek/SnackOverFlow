//
//  LocalKeys.swift
//  SnackOverFlow
//
//  Created by aykut ipek on 6.06.2023.
//

import SwiftUI


struct LocaleKeys {
    enum Auth: String {
        case facebook = "signInFacebook"
        case google = "signInGoogle"
        case apple = "signInApple"
        case custom = "signUpWithEmail"
    }
    
    enum Buttons: String {
        case getStarted = "getStarted"
    }
    
    enum General: String {
        case emailHint = "emailHint"
        case passwordHint = "passwordHint"
    }
    
    enum Login: String {
        case welcomeBack = "welcomeBack"
        case createAccount = "createAccount"
        case terms = "termsAndCondition"
    }
    
    enum TabView: String {
        case home = "tabHome"
        case market = "tabMarket"
        case create = "tabCreate"
        case wishlist = "tabWishList"
        case account = "tabAccount"
        
    }
}


extension String{
    /// It localize any string from Localizable.string
    /// - Returns: Localized value
    func locale() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }
}
