//
//  ViewController.swift
//  HorizontalCollectionView
//
//  Created by Supannee Mutitanon on 17/1/2566 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    let numberOfRow = 2
    let numberOfColumn = 5
    let cellsize = CGSize(width: 150, height: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "ContentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        let layout = HorizontalCollectionViewLayout()
        layout.numberOfColumn = numberOfColumn
        layout.numberOfRow = numberOfRow
        layout.cellSize = cellsize
        collectionView.collectionViewLayout = layout
        
        let width = cellsize.width * CGFloat(numberOfColumn)
        let height = cellsize.height * CGFloat(numberOfRow)
        collectionView.widthAnchor.constraint(equalToConstant: width).isActive = true
        collectionViewHeightConstraint.constant = height
        collectionView.layoutIfNeeded()
        debugPrint("width \(width) height \(height)")
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? ContentCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setLabel(text: "\(indexPath.row)")
        return cell
    }
}
