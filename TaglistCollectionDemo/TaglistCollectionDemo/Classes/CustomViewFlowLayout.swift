//
//  CustomViewFlowLayout.swift
//  TaglistCollectionDemo
//
//  Created by Mohammed Elsammak on 2018/01/17.
//  Copyright © 2018 Sanjaysinh Chauhan. All rights reserved.
//

import UIKit

class CustomViewFlowLayout : UICollectionViewFlowLayout {
    
    let cellSpacing:CGFloat = 0
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        if let attributes = super.layoutAttributesForElements(in: rect) {
            
            var leftMargin = sectionInset.left
            var maxY: CGFloat = -1.0
            attributes.forEach { layoutAttribute in
                if layoutAttribute.frame.origin.y >= maxY {
                    leftMargin = sectionInset.left
                }
                
                layoutAttribute.frame.origin.x = leftMargin
                
                leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
                maxY = max(layoutAttribute.frame.maxY , maxY)
            }
            
            return attributes
            
//            for (index, attribute) in attributes.enumerated() {
//                if index == 0 { continue }
//                let prevLayoutAttributes = attributes[index - 1]
//                let origin = prevLayoutAttributes.frame.maxX
//                if(origin + cellSpacing + attribute.frame.size.width < self.collectionViewContentSize.width) {
//                    attribute.frame.origin.x = origin + cellSpacing
//                }
//            }
//            return attributes
        }
        return nil
    }
}
