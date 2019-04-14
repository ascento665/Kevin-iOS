// Created by Julian Dunskus

import UIKit

let dateFormatter = DateFormatter() <- {
	$0.dateStyle = .medium
	$0.timeStyle = .medium
}

final class EventCell: UITableViewCell, Reusable {
	@IBOutlet var capturedImageView: UIImageView!
	@IBOutlet var dateLabel: UILabel!
	@IBOutlet var outcomeLabel: UILabel!
	
	var event: Event! {
		didSet { update() }
	}
	
	func update() {
		capturedImageView.image = event.image
		dateLabel.text = dateFormatter.string(from: event.date)
		outcomeLabel.text = event.outcomeDescription
	}
}
