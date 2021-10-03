//
//  DetailViewController.swift
//  SuperheroLibrary
//
//  Created by Nikita Kryuchkov on 02.10.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var hero: SuperHero!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    @IBOutlet var detailImage: HeroImageView!
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var intelligenceLabel: UILabel!
    @IBOutlet var strengthLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    @IBOutlet var durabilityLabel: UILabel!
    @IBOutlet var powerLabel: UILabel!
    @IBOutlet var combatLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        setImage(url: hero.images?.lg ?? "")
        setInfo()
    }
    
    private func setInfo() {
        nameLabel.text = "Name is \(hero.name ?? "Unknown")"
        
        guard let powerstats = hero.powerstats else { return  }
        intelligenceLabel.text = "INTELLIGENCE: \(powerstats.intelligence ?? 0 )"
        strengthLabel.text = "STRENGTH: \(powerstats.strength ?? 0)"
        speedLabel.text = "SPEED: \(powerstats.speed ?? 0)"
        durabilityLabel.text = "DURABILTY: \(powerstats.durability ?? 0)"
        powerLabel.text = "POWER: \(powerstats.power ?? 0)"
        combatLabel.text = "COMBAT: \(powerstats.combat ?? 0)"
    }
    
    private func setImage(url: String) {
        activityIndicator.stopAnimating()
        detailImage.cacheImage(url: url)
    }
}
