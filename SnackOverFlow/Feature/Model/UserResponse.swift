//
//  UserResponse.swift
//  SnackOverFlow
//
//  Created by aykut ipek on 8.06.2023.

// MARK: - UserResponse
import Foundation

// MARK: - UserResponse
struct UserResponse: Codable {
    let page, perPage, total, totalPages: Int?
    let data: [Datum]?
    let support: Support?

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int?
    let email, firstName, lastName: String?
    let avatar: String?

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

// MARK: - Support
struct Support: Codable {
    let url: String?
    let text: String?
}
