//
//  LoginModel.swift
//  SnackOverFlow
//
//  Created by aykut ipek on 9.06.2023.
//

import Foundation

// MARK: - LoginRequest
struct LoginRequest: Encodable {
    let email, password: String
}


// MARK: - LoginResponse
struct LoginResponse: Codable {
    let token: String
}
