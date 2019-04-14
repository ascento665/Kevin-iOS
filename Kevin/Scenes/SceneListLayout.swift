// Created by Julian Dunskus

import UIKit

final class SceneListLayout: UICollectionViewFlowLayout {
	override func prepare() {
		super.prepare()
		
		guard let collectionView = collectionView else { return }
		
		let availableSize = collectionView.bounds.inset(by: sectionInset).size
		let minimumWidth: CGFloat = 150
		let spacing = minimumInteritemSpacing
		let amount = max(1, ((availableSize.width + spacing) / (minimumWidth + spacing)).rounded(.down))
		let cellWidth = (availableSize.width - (amount - 1) * spacing) / amount
		itemSize = CGSize(width: cellWidth, height: cellWidth * 3 / 4)
	}
	
	override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
		return true
	}
}

