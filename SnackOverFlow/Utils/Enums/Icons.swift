//
//  Icons.swift
//  SnackOverFlow
//
//  Created by aykut ipek on 6.06.2023.
//

import Foundation

enum Icons: String {
    case appLogo = "app_logo (1)"
}

struct IconItems {
    enum Social: String{
        case facebook = "ic_facebook"
        case google = "ic_google"
        case apple = "ic_apple"
    }
    
    enum TabView: String {
        case home = "Home"
        case person = "Person"
        case create = "create"
        case favorite = "wishlist"
        case market = "market"
    }

    static let mail: String = "ic_mail"
    static let lock: String = "ic_lock"
    

}
