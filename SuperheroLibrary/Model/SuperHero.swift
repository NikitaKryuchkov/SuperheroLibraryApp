//
//  SuperHero.swift
//  SuperheroLibrary
//
//  Created by Nikita Kryuchkov on 02.10.2021.
//


struct SuperHero: Decodable {
    
    let name: String?
    let powerstats: PowerStats?
    let images: Images?
}

struct PowerStats: Decodable {
    
    let intelligence: Int?
    let strength: Int?
    let speed: Int?
    let durability: Int?
    let power: Int?
    let combat: Int?
}

struct Images: Decodable {
    
    let xs: String?
    let sm: String?
    let md: String?
    let lg: String?
}
