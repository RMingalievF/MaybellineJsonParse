//
//  MaybellineCollectionViewCell.swift
//  MaybellineJsonParse
//
//  Created on 09.04.2022.
//

import UIKit

class MaybellineCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet var imageView: UIImageView! {
		didSet {
			imageView.layer.cornerRadius = 20
		}
	}
	
	@IBOutlet var nameLabel: UILabel!
	@IBOutlet var priceLabel: UILabel!
	@IBOutlet var descriptionLabel: UILabel!
	
	func configure(with maybelline: Maybelline) {
		nameLabel.text = maybelline.name
		priceLabel.text = "\(maybelline.price ?? "Out of sale")"
		descriptionLabel.text = maybelline.description
		
		NetworkMaybellineManager.shared.fetchImage(from: maybelline.imageLink) { result in
			switch result {
			case .success(let imageData):
				self.imageView.image = UIImage(data: imageData)
			case .failure(let error):
				print(error)
			}
		}
	}
	
	
}
