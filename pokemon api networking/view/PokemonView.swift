//
//  PokemonView.swift
//  pokemon api networking
//
//  Created by nur on 6.07.2024.
//

import SwiftUI


struct PokemonView: View {
    @StateObject private var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.pokemons) { pokemon in
                VStack(alignment: .leading) {
                    Text("Pokemonlar:")
                    Text(pokemon.name)
                        .font(.title)
                    Text(pokemon.type.joined(separator: ", "))
                        .font(.subheadline)
                    Text(pokemon.img)
                        .font(.subheadline)
                }
            }
            .navigationTitle("Pokemones")
        }
    }
}

#Preview {
    PokemonView()
}




