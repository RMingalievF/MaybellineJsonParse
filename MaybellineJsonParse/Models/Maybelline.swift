//
//  Maybelline.swift
//  MaybellineJsonParse
//
//  Created on 09.04.2022.
//

import Foundation

struct Maybelline: Codable {
	let id: Int
	let name: String
	let imageLink: String
	let description: String
	let price: String?

	enum CodingKeys: String, CodingKey {
		case id = "id"
		case name = "name"
		case imageLink = "image_link"
		case description = "description"
		case price = "price"
	}
}
