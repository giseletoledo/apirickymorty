//
//  RickModel.swift
//  rickymorty
//
//  Created by GISELE TOLEDO on 27/09/23.
//

struct RickModel {
    let title: String
    let status: String
    let lastKnownLocation: String
    let memories: String
    let imageNames: String
    
    init(title: String, status: String, lastKnownLocation: String, memories: String, imageNames: String) {
        self.title = title
        self.status = status
        self.lastKnownLocation = lastKnownLocation
        self.memories = memories
        self.imageNames = imageNames
    }
}

