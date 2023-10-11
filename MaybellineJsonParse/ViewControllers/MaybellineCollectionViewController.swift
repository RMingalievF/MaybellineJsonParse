//
//  ViewController.swift
//  MaybellineJsonParse
//
//  Created on 09.04.2022.
//

import UIKit

class MaybellineCollectionViewController: UIViewController {
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	var maybellines: [Maybelline] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		fetchMaybs()
	}
	
	private func fetchMaybs() {
		NetworkMaybellineManager.shared.fetchMaybellineInfo(from: NetworkMaybellineManager.shared.urlAPI) { result in
			switch result {
			case .success(let maybellines):
				DispatchQueue.main.async {
					self.maybellines = maybellines
					self.collectionView.reloadData()
				}
			case .failure(let error):
				print(error)
			}
		}
	}
}

extension MaybellineCollectionViewController: UICollectionViewDataSource {
	// MARK: - UICollectionViewDataSource
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		maybellines.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MaybellineCollectionViewCell
		let maybs = maybellines[indexPath.item]
		cell.configure(with: maybs)
		return cell
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		1
	}
	
}


