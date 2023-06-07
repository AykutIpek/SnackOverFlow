//
//  Images.swift
//  SnackOverFlow
//
//  Created by aykut ipek on 6.06.2023.
//

import Foundation
import SwiftUI


enum Images: String {
    case juice = "image_juice"
}

struct ImageItems {
    enum Authentication: String {
    case login = "wolcano"
    }
}


extension String{
    /// String Image
    /// - Returns: realated image from Image asset
    func image() -> Image {
        return Image(self)
    }
}
