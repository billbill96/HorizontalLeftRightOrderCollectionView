//
//  ContentCollectionViewCell.swift
//  HorizontalCollectionView
//
//  Created by Supannee Mutitanon on 17/1/2566 BE.
//

import UIKit

class ContentCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        layer.borderColor = UIColor.red.cgColor
        layer.borderWidth = 1
    }

    func setLabel(text: String) {
        titleLabel.text = text
    }
}
