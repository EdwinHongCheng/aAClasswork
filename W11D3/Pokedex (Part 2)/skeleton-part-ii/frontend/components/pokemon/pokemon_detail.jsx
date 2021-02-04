import React from 'react';

class PokemonDetail extends React.Component {

  // componentDidMount() {
  //   this.props.requestSinglePokemon();
  // }

  render () {
    let pokemon = this.props.pokemon;

    return (
      <div>
        <h2>
          {pokemon.name}          
        </h2>
        <ul>
          <li>
            {pokemon.poke_type}
          </li>
          <li>
            {pokemon.attack}
          </li>
          <li>
            {pokemon.defense}
          </li>
          </ul>
          <img src={pokemon.image_url}/>
      </div>
    )
  }
}

export default PokemonDetail;