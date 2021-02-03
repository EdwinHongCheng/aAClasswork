import React from 'react';
import { Route } from 'react-router-dom';
import PokemonIndexContainer from './pokemon/pokemon_index_container';

// implicit return
const App = () => (
    <Route path="/" component={PokemonIndexContainer} />
);

export default App;