//
//  Profile.swift
//  friendface
//
//  Created by Godwin IE on 20/02/2024.
//

import Foundation

struct Model: Codable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String //format to date later
    let tags: [String]
    let friends: [Friend]
}


struct Friend: Codable {
    let id: String
    let name: String
}
