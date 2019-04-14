// Created by Julian Dunskus

import UIKit

struct Event {
	var image: UIImage
	var date: Date
	var outcome: Outcome?
}

enum Outcome: String {
	case accepted
	case rejected
}
