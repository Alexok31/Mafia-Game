//
//  CircleLayout.swift
//  Mafia
//
//  Created by Александр Харченко on 12/10/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation
import UIKit

class CircleLayout: UICollectionViewLayout {
    
    private var center: CGPoint!
    private var itemSize: CGSize!
    private var radius: CGFloat!
    private var numberOfItems: Int!
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        center = CGPoint(x: collectionView.bounds.midX, y: collectionView.bounds.midY)
        let shortestAxisLength = min(collectionView.bounds.width, collectionView.bounds.height)
        itemSize = CGSize(width: shortestAxisLength * 0.2, height: shortestAxisLength * 0.2)
        radius = shortestAxisLength * 0.4
        numberOfItems = collectionView.numberOfItems(inSection: 0)
    }
    
    override var collectionViewContentSize: CGSize {
        return collectionView!.bounds.size
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        
        let angle = 2 * .pi * CGFloat(indexPath.item) / CGFloat(numberOfItems)
        
        attributes.center = CGPoint(x: center.x + radius * cos(angle), y: center.y + radius * sin(angle))
        attributes.size = itemSize
        
        return attributes
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return (0 ..< collectionView!.numberOfItems(inSection: 0))
            .compactMap { item -> UICollectionViewLayoutAttributes? in    // `flatMap` in Xcode versions prior to 9.3
                self.layoutAttributesForItem(at: IndexPath(item: item, section: 0))
        }
    }
}
