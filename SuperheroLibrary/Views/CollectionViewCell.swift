//
//  CollectionViewCell.swift
//  SuperheroLibrary
//
//  Created by Nikita Kryuchkov on 02.10.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet weak var mainImage: HeroImageView! {
        didSet{
            mainImage.layer.cornerRadius = 15
        }
    }
    
    func configure(with hero: SuperHero) {
        mainLabel.text = hero.name
        mainImage.cacheImage(url: hero.images?.sm ?? "")
    }
}
