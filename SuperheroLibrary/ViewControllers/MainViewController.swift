//
//  ViewController.swift
//  SuperheroLibrary
//
//  Created by Nikita Kryuchkov on 02.10.2021.
//

import UIKit

class MainViewController: UICollectionViewController {
        
    private var heroes: [SuperHero] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchHeroes()
    }
    
    private func fetchHeroes() {
        DataFetcherService.shared.fetchListOfHeroes { superHeroes in
            self.heroes = superHeroes ?? []
            self.collectionView.reloadData()
        }
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else { return }
        detailVC.hero = sender as? SuperHero
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let superHero = heroes[indexPath.row]
        cell.configure(with: superHero)
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let superHeroe = heroes[indexPath.row]
        self.performSegue(withIdentifier: "showDetail", sender: superHeroe)
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.size.width - 20) / 2.5
        let height = width * 1.5
        return CGSize(width: width, height: height)
    }
}

