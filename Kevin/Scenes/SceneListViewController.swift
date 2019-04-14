// Created by Julian Dunskus

import UIKit

final class SceneListViewController: UICollectionViewController {
	var scenes: [Scene] = Scene.allScenes {
		didSet { collectionView.reloadData() }
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView.reloadData()
	}
	
	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return scenes.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		return collectionView.dequeue(SceneCell.self, for: indexPath)! <- {
			$0.scene = scenes[indexPath.item]
		}
	}
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		Lambda.request(scenes[indexPath.item])
	}
}
