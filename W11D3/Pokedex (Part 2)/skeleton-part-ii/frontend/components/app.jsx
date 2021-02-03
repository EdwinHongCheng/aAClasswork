import React from 'react';
import { Route } from 'react-router-dom';
import PokemonIndexContainer  from './pokemon/pokemon_index_container';
import PokemonDetailContainer from './pokemon/pokemon_detail_container';

// implicit return
const App = () => (
    <div>
      <Route path="/"            component={PokemonIndexContainer}  />
      <Route path="/pokemon/:id" component={() => <p>woo</p>} /> 
    </div>
);

export default App;