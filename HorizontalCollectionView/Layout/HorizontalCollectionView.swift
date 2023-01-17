//
//  HorizontalCollectionView.swift
//  HorizontalCollectionView
//
//  Created by Supannee Mutitanon on 17/1/2566 BE.
//

import UIKit

class HorizontalCollectionView: UICollectionViewLayout {
    var numberOfColumn = 0
    var numberOfRow = 0
    var cellSize = CGSize(width: 0, height: 0)
    
    private var attributesCache: [UICollectionViewLayoutAttributes] = []
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: cellSize.width * CGFloat(numberOfColumn),
                      height: cellSize.height * CGFloat(numberOfRow))
    }
    
    override func prepare() {
        guard let collectionView = self.collectionView,
              attributesCache.isEmpty else {
            return
        }
        
        let numberOfCell = collectionView.numberOfItems(inSection: 0)
        var yOffset: [CGFloat] = .init(repeating: 0, count: numberOfCell)
        var xOffset: [CGFloat] = []
        for index in 0..<numberOfColumn {
            xOffset.append(CGFloat(index) * cellSize.width)
        }
        
        var column = 0
        for index in 0..<numberOfCell {
            let indexPath = IndexPath(item: index, section: 0)
            let frame = CGRect(x: xOffset[column],
                               y: yOffset[column],
                               width: cellSize.width,
                               height: cellSize.height)
            
            let attrribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attrribute.frame = frame
            attributesCache.append(attrribute)
            
            yOffset[column] = yOffset[column] + cellSize.height
            column = column < (numberOfColumn - 1) ? (column + 1) : 0
        }
    }
}
