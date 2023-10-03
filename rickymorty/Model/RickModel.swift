//
//  RickModel.swift
//  rickymorty
//
//  Created by GISELE TOLEDO on 27/09/23.
//

struct RickAPI: Codable {
    let info: InfoResponse?
    let results: [Results]?
    
    init(info: InfoResponse?, results: [Results]?) {
        self.info = info
        self.results = results
    }
}
    
struct InfoResponse: Codable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String?
    
    init(count: Int, pages: Int, next: String, prev: String?){
        self.count = count
        self.pages = pages
        self.next = next
        self.prev = prev
    }
}

struct Results: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: OriginResponse?
    let location: LocationResponse?
    let image: String
    let episode: [String]
    
    init(id: Int, name: String, status: String, species: String, type: String, gender: String, origin: OriginResponse?, location: LocationResponse?, image: String, episode: [String]){
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
    }
}

struct OriginResponse: Codable {
    let name: String
    let url: String
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}

struct LocationResponse: Codable {
    let name: String
    let url: String
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}

struct RickModel {
    let title: String
    let status: String
    let lastKnownLocation: String
    let memories: String
    let imageNames: String
}
