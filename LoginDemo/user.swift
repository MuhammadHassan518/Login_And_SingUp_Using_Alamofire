////
////  user.swift
////  LoginDemo
////
////  Created by Muhammad Hassan on 28/03/2022.
////
//
//import Foundation
//import ObjectMapper
//
//public class User: Codable {
//
//    // MARK: Declaration for string constants to be used to decode and also serialize.
//         let id = "id"
//         let name = "name"
//         let mobileNo = "mobile_no"
//         let email = "email"
//         let address = "address"
//
//
//    private enum CodingKeys: String, CodingKey {
//            case id
//            case name
//            case mobileNo
//            case email
//            case address
//
//        }
////
////       let decoder = JSONDecoder()
////       let lisa = try decoder.decode(User.self,from: Data)
//
//}



// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let status: Bool
    let data: DataClass
    let message: String
}

// MARK: - DataClass
struct DataClass: Codable {
    let accessToken, tokenType, expiresAt: String
    let user: User

    enum CodingKeys: String, CodingKey {
        case accessToken
        case tokenType
        case expiresAt
        case user
    }
}

// MARK: - User
struct User: Codable {
    let id: Int
    let name, email, emailVerifiedAt: String
    let photo: String
    let birthday, gender, phone, maritalStatus: String
    let createdAt, updatedAt: String
    let deletedAt: JSONNull?
    let active: Int
    let countryID, cityID, intro, agentName: String
    let firebaseToken: String
    let notifications, giftPreferences: Int
    let interestFlag: Bool
    let tag: String
    let selectedCityID, selectedCountryID, followers, following: Int
    let currentFollowing, sendCoin: Bool
    let userID: Int

    enum CodingKeys: String, CodingKey {
        case id, name, email
        case emailVerifiedAt
        case photo, birthday, gender, phone
        case maritalStatus
        case createdAt
        case updatedAt
        case deletedAt
        case active
        case countryID
        case cityID
        case intro
        case agentName
        case firebaseToken
        case notifications
        case giftPreferences
        case interestFlag
        case tag
        case selectedCityID
        case selectedCountryID
        case followers, following
        case currentFollowing
        case sendCoin
        case userID
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
