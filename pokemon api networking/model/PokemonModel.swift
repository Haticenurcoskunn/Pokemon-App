//
//  PokemonModel.swift
//  pokemon api networking
//
//  Created by nur on 7.07.2024.
//

import Foundation

struct Pokemon: Codable, Identifiable {
    var id: Int
    var name: String
    var img: String
    var type: [String]
}

struct PokemonResponse: Codable {
    var pokemon: [Pokemon]
}
