//
//  ViewModel.swift
//  pokemon api networking
//
//  Created by nur on 7.07.2024.
//

import Foundation

class PokemonViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    

    init() {
        Task {
            await fetchData()
        }
    }
    
    func fetchData() async {
        let endpoint = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json"
        
        guard let url = URL(string: endpoint) else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(PokemonResponse.self, from: data) {
                DispatchQueue.main.async {
                    self.pokemons = decodedResponse.pokemon
                }
            } else {
                print("Failed to decode JSON")
            }
        } catch {
            print("Error fetching data: \(error)")
        }
    }
}
