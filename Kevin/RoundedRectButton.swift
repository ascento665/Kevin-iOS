// Created by Julian Dunskus

import UIKit

fileprivate let shadowOpacity: Float = 0.2
fileprivate let shadowOffset = CGSize(width: 0, height: 6)
fileprivate let shadowRadius: CGFloat = 12

@IBDesignable
class RoundedRectButton: UIControl {
	override var bounds: CGRect {
		didSet {
			layer.cornerRadius = 0.33 * frame.size.min
		}
	}
	
	override var isHighlighted: Bool {
		didSet { updateAppearance() }
	}
	
	@IBInspectable
	var text: String {
		get { return label.text! }
		set { label.text = newValue }
	}
	
	lazy var label: UILabel = UILabel(frame: bounds) <- {
		$0.autoresizingMask = .flexibleSize
		$0.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
		$0.textAlignment = .center
		$0.setContentHuggingPriority(.init(800), for: .horizontal)
		$0.setContentHuggingPriority(.init(800), for: .vertical)
		$0.setContentCompressionResistancePriority(.init(800), for: .horizontal)
		$0.setContentCompressionResistancePriority(.init(800), for: .vertical)
		$0.text = "example"
		addSubview($0)
	}
	
	override var intrinsicContentSize: CGSize {
		return label.intrinsicContentSize + 2 * 16 * CGSize.one
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		updateAppearance()
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
