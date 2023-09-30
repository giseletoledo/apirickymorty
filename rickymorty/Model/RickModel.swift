//
//  RickModel.swift
//  rickymorty
//
//  Created by GISELE TOLEDO on 27/09/23.
//

struct RickModel: Decodable {
    let title: String
    let status: String
    let lastKnownLocation: String
    let memories: String
    let imageNames: String

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        title = try container.decode(String.self, forKey: .title)
        status = try container.decode(String.self, forKey: .status)
        lastKnownLocation = try container.decode(String.self, forKey: .lastKnownLocation)
        memories = try container.decode(String.self, forKey: .memories)
        imageNames = try container.decode(String.self, forKey: .imageNames)
    }

    enum CodingKeys: String, CodingKey {
        case title
        case status
        case lastKnownLocation
        case memories
        case imageNames
    }
}

