// Created by Julian Dunskus

import UIKit

struct Scene {
	static let allScenes: [Scene] = [
		Scene(name: "Leaving Home", color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), id: "leaving_house"),
		Scene(name: "Dance Mode", color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), id: "requesting_dance_mode"),
		Scene(name: "Romance", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), id: "requesting_romantic_mode"),
	]
	
	var name: String
	var color: UIColor
	var id: String
}
