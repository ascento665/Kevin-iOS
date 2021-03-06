// Created by Julian Dunskus

import UIKit

final class EventViewController: UIViewController, Reusable {
	@IBOutlet var imageView: UIImageView!
	@IBOutlet var dateLabel: UILabel!
	
	@IBOutlet var stateLabel: UILabel!
	
	@IBOutlet var buttonStack: UIStackView!
	
	@IBAction func acceptPerson() {
		Lambda.overrideAlert()
		
		UIView.animate(withDuration: 0.1) {
			self.event.outcome = .accepted
		}
	}
	
	@IBAction func rejectPerson() {
		UIView.animate(withDuration: 0.1) {
			self.event.outcome = .rejected
		}
	}
	
	var event: Event! {
		didSet { update() }
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		update()
	}
	
	func update() {
		guard isViewLoaded else { return }
		
		imageView.image = event.image
		dateLabel.text = dateFormatter.string(from: event.date)
		
		stateLabel.isHidden = event.outcome == nil
		buttonStack.isHidden = event.outcome != nil
		if let outcome = event.outcome {
			stateLabel.text = outcome.rawValue
		}
	}
}
