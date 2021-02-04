import React from 'react';
import PokemonIndexItem from './pokemon_index_item';

class PokemonIndex extends React.Component {

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render () {
    let pokemon = this.props.pokemon;

    const pokemonItems = pokemon.map(poke => (
        <PokemonIndexItem key={poke.id} pokemon={poke} />
      )
    );
    
    return (
      <ul>{pokemonItems}</ul>
    )
  }
}

  
export default PokemonIndex;