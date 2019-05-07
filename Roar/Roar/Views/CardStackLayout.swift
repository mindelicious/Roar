//
//  CardStackLayout.swift
//  Roar
//
//  Created by Matt on 05/05/2019.
//  Copyright © 2019 mindelicious. All rights reserved.
//

import UIKit

class CardStackLayout: UICollectionViewLayout {

    var panGestureRecognizer: UIPanGestureRecognizer = UIPanGestureRecognizer()
    
     let treshold: CGFloat = 80
    
    typealias CellWithIndexPath = (cell: UICollectionViewCell, indexPath: IndexPath)
    
    private let animationDuration: TimeInterval = 0.15
    
    private var topCellWithIndexPath: CellWithIndexPath? {
        let lastItem = collectionView?.numberOfItems(inSection: 0) ?? 0
        let indexPath = IndexPath(item: lastItem - 1, section: 0)
        
        guard let cell = collectionView?.cellForItem(at: indexPath) else { return nil }
        
        return (cell: cell, indexPath: indexPath)
    }
    
    private var bottomCellWithIndexPath: CellWithIndexPath? {
        guard let numItems = collectionView?.numberOfItems(inSection: 0), numItems > 1 else { return nil }
        
        let indexPath = IndexPath(item: 0 - 2, section: 0)
        
        guard let cell = collectionView?.cellForItem(at: indexPath) else { return nil }
        
        return (cell: cell, indexPath: indexPath)
    }
    
    override func prepare() {
        super.prepare()
        
        panGestureRecognizer.addTarget(self, action: #selector(handlePan(gestureRecognizerr:)))
        collectionView?.addGestureRecognizer(panGestureRecognizer)
        
    }
    
    fileprivate func indexPathsForElementsInRect(_ rect: CGRect) -> [IndexPath] {
        var indexPaths: [IndexPath] = []
        
        if let numItems = collectionView?.numberOfItems(inSection: 0), numItems > 0 {
            for i in 0...numItems-1 {
                indexPaths.append(IndexPath(item: i, section: 0))
            }
        }
        
        return indexPaths
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        attributes.frame = collectionView?.bounds ?? .zero
        
        var isNotTop = false
        if let numItems = collectionView?.numberOfItems(inSection: 0), numItems > 0 {
            isNotTop = indexPath.row != numItems - 1
        }
        
        attributes.alpha = isNotTop ? 0 : 1
        
        return attributes
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let indexPaths = indexPathsForElementsInRect(rect)
        let layoutAttributes = indexPaths.map() { layoutAttributesForItem(at: $0) }
            .filter { $0 != nil }.map { $0! }
        
        return layoutAttributes
    }
    
    @objc func handlePan(gestureRecognizerr: UIPanGestureRecognizer) {
        let translation = gestureRecognizerr.translation(in: collectionView)
        
        let xOffset = translation.x
        let maxOffset = (collectionView?.frame.width ?? 0) * treshold
        
        
        switch  gestureRecognizerr.state {
        case .changed:
            if let topCard = topCellWithIndexPath {
                topCard.cell.transform = CGAffineTransform(translationX: xOffset, y: 0)
            }
            
            if let bottomCard = bottomCellWithIndexPath {
                bottomCard.cell.alpha = 1
            }
        case .ended:
            if abs(xOffset) > maxOffset {
                if let topCard = topCellWithIndexPath {
                    //animate and remove
                    animateAndRemove(left: xOffset < 0, cell: topCard.cell, completion: nil)
                }
                if let bottomCrad = bottomCellWithIndexPath {
                    //animate into primary position
                    animateIntoPosition(cell: bottomCrad.cell)
                }
            } else {
                if let topCard = topCellWithIndexPath {
                    //animate back to primary position
                    animateIntoPosition(cell: topCard.cell)
                }
            }
        default:
            break
        }
    }
    
    func animateIntoPosition(cell: UICollectionViewCell) {
        
        UIView.animate(withDuration: animationDuration) {
            cell.transform = CGAffineTransform.identity
            cell.alpha = 1
        }
    }
    
    func animateAndRemove(left: Bool, cell: UICollectionViewCell, completion: (() -> ())?) {
        
        let screenWidth = UIScreen.main.bounds.width
        
        UIView.animate(withDuration: animationDuration, animations: {
            
            let xTranslateOffScreen = CGAffineTransform(translationX: left ? -screenWidth : screenWidth, y: 0)
            cell.transform = xTranslateOffScreen
        }) { (completed) in
            completion?()
        }
    }
    
}

