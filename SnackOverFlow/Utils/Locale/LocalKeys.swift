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
}


extension String{
    /// It localize any string from Localizable.string
    /// - Returns: Localized value
    func locale() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }
}
