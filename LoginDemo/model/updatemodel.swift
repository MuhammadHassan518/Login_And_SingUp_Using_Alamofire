
//  updatemodel.swift
//  LoginDemo
//  Created by Muhammad Hassan on 31/03/2022.
//

import Foundation

struct UpdateModel : Codable {
    let id : Int?
    let name : String?
    let email : String?
    let email_verified_at : String?
    let photo : String?
    let birthday : String?
    let gender : String?
    let phone : String?
    let marital_status : String?
    let created_at : String?
    let updated_at : String?
    let deleted_at : String?
    let active : Int?
    let country_id : String?
    let city_id : String?
    let intro : String?
    let agent_name : String?
    let firebase_token : String?
    let notifications : Int?
    let gift_preferences : Int?
    let categories : [Categories]?
    let tag : String?
    let selected_city_id : Int?
    let selected_country_id : Int?
    let followers : Int?
    let following : Int?
    let current_following : Bool?
    let send_coin : Bool?
    let user_id : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case email = "email"
        case email_verified_at = "email_verified_at"
        case photo = "photo"
        case birthday = "birthday"
        case gender = "gender"
        case phone = "phone"
        case marital_status = "marital_status"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case deleted_at = "deleted_at"
        case active = "active"
        case country_id = "country_id"
        case city_id = "city_id"
        case intro = "intro"
        case agent_name = "agent_name"
        case firebase_token = "firebase_token"
        case notifications = "notifications"
        case gift_preferences = "gift_preferences"
        case categories = "categories"
        case tag = "tag"
        case selected_city_id = "selected_city_id"
        case selected_country_id = "selected_country_id"
        case followers = "followers"
        case following = "following"
        case current_following = "current_following"
        case send_coin = "send_coin"
        case user_id = "user_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        email_verified_at = try values.decodeIfPresent(String.self, forKey: .email_verified_at)
        photo = try values.decodeIfPresent(String.self, forKey: .photo)
        birthday = try values.decodeIfPresent(String.self, forKey: .birthday)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        marital_status = try values.decodeIfPresent(String.self, forKey: .marital_status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        deleted_at = try values.decodeIfPresent(String.self, forKey: .deleted_at)
        active = try values.decodeIfPresent(Int.self, forKey: .active)
        country_id = try values.decodeIfPresent(String.self, forKey: .country_id)
        city_id = try values.decodeIfPresent(String.self, forKey: .city_id)
        intro = try values.decodeIfPresent(String.self, forKey: .intro)
        agent_name = try values.decodeIfPresent(String.self, forKey: .agent_name)
        firebase_token = try values.decodeIfPresent(String.self, forKey: .firebase_token)
        notifications = try values.decodeIfPresent(Int.self, forKey: .notifications)
        gift_preferences = try values.decodeIfPresent(Int.self, forKey: .gift_preferences)
        categories = try values.decodeIfPresent([Categories].self, forKey: .categories)
        tag = try values.decodeIfPresent(String.self, forKey: .tag)
        selected_city_id = try values.decodeIfPresent(Int.self, forKey: .selected_city_id)
        selected_country_id = try values.decodeIfPresent(Int.self, forKey: .selected_country_id)
        followers = try values.decodeIfPresent(Int.self, forKey: .followers)
        following = try values.decodeIfPresent(Int.self, forKey: .following)
        current_following = try values.decodeIfPresent(Bool.self, forKey: .current_following)
        send_coin = try values.decodeIfPresent(Bool.self, forKey: .send_coin)
        user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
    }

}
struct Categories : Codable {
    let id : Int?
    let name : String?
    let image : String?
    let image_hover : String?
    let status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case image = "image"
        case image_hover = "image_hover"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        image_hover = try values.decodeIfPresent(String.self, forKey: .image_hover)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
struct UpdateModel_Base : Codable {
    let status : Bool?
    var data : UpdateModel?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        data = try values.decodeIfPresent(UpdateModel.self, forKey: .data)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}
