//
//  DataFetcherService.swift
//  SuperheroLibrary
//
//  Created by Nikita Kryuchkov on 03.10.2021.
//

import Foundation

class DataFetcherService {
    
    static let shared = DataFetcherService()
    
    private var dataFetcher: DataFetcher
    
    private init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    func fetchListOfHeroes(completion: @escaping ([SuperHero]?) -> Void) {
        let urlHeroes = "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.2.0/api/all.json"
        dataFetcher.fetchGenericJSONData(urlString: urlHeroes, response: completion)
    }
    
    func fetchImage(url: URL, completion: @escaping (Data) -> Void) {
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                completion(imageData)
            }
        }
    }
}


