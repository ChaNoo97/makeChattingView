//
//  SocketModel.swift
//  chatting
//
//  Created by Hoo's MacBookPro on 2022/01/14.
//
import Foundation

struct SocketChat: Codable {
	let text, userID, name, username: String
	let id, createdAt, updatedAt: String
	let v: Int
	let lottoID: String

	enum CodingKeys: String, CodingKey {
		case text
		case userID = "userId"
		case name, username
		case id = "_id"
		case createdAt, updatedAt
		case v = "__v"
		case lottoID = "id"
	}
}
