import React from 'react';
import { Route } from 'react-router-dom';
import PokemonIndexContainer  from './pokemon/pokemon_index_container';
import PokemonDetailContainer from './pokemon/pokemon_detail_container';

// implicit return
const App = () => (

  <section className="pokedex">
    <Route path="/pokemon/:id" component={PokemonDetailContainer} /> 
    <Route path="/"            component={PokemonIndexContainer}  />
  </section>
  
);

export default App;