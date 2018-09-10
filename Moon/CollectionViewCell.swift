//
//  CollectionViewCell.swift
//  Moon
//
//  Created by Nguyenthanh Long on 9/8/18.
//  Copyright © 2018 Geniee. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var animalImage: UIImageView!
    
    @IBOutlet weak var animalName: UILabel!
    
    
    func displayContent(image: UIImage, name: String){
        animalImage.image = image;
        animalName.text = name;
    }
}
