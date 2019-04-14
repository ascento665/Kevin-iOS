// Created by Julian Dunskus

import UIKit

fileprivate let shadowOpacity: Float = 0.2
fileprivate let shadowOffset = CGSize(width: 0, height: 6)
fileprivate let shadowRadius: CGFloat = 12

final class SceneCell: UICollectionViewCell, Reusable {
	@IBOutlet var nameLabel: UILabel!
	
	override var bounds: CGRect {
		didSet {
			layer.cornerRadius = 0.33 * frame.size.min
		}
	}
	
	override var isHighlighted: Bool {
		didSet { updateAppearance() }
	}
	
	var scene: Scene! {
		didSet { update() }
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		//contentView.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 4.0/3).isActive = true
	}
	
	func update() {
		var brightness: CGFloat = .nan
		var saturation: CGFloat = .nan
		scene.color.getHue(nil, saturation: &saturation, brightness: &brightness, alpha: nil)
		nameLabel.textColor = (brightness - saturation) > 0.6 ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
		nameLabel.text = scene.name
		backgroundColor = scene.color
	}
	
	func updateAppearance() {
		UIView.animate(withDuration: 0.1) { [layer, isHighlighted] in
			layer.shadowOpacity = shadowOpacity
			
			layer.shadowOffset = isHighlighted ? shadowOffset / 4 : shadowOffset
			layer.shadowRadius = isHighlighted ? shadowRadius / 4 : shadowRadius
			self.transform = isHighlighted ? .init(scaleX: 0.95, y: 0.95) : .identity
		}
	}
}
