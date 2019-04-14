// Created by Julian Dunskus

import UIKit

struct Event {
	var image: UIImage
	var date: Date
	var outcome: Outcome?
	
	var outcomeDescription: String {
		switch outcome {
		case .accepted?:
			return "✅ accepted"
		case .rejected?:
			return "🚫 rejected"
		case nil:
			return "🤔 undecided"
		}
	}
}

extension Event: Codable {
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: Key.self)
		try image = NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(container.decode(Data.self, forKey: .image)) as? UIImage
			??? DecodingError.dataCorruptedError(forKey: .image, in: container, debugDescription: "non-image NSCoding object stored")
		try date = container.decode(Date.self, forKey: .date)
		try outcome = container.decode(Outcome?.self, forKey: .outcome)
	}
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: Key.self)
		try container.encode(NSKeyedArchiver.archivedData(withRootObject: image, requiringSecureCoding: false), forKey: .image)
		try container.encode(date, forKey: .date)
		try container.encode(outcome, forKey: .outcome)
	}
	
	enum Key: CodingKey {
		case image
		case date
		case outcome
	}
}

enum Outcome: String, Codable {
	case accepted
	case rejected
}
