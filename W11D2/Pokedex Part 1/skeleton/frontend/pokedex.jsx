import React from 'react';
import ReactDOM from 'react-dom';

import { fetchAllPokemon } from './util/api_util';

document.addEventListener('DOMContentLoaded', () => {

    window.fetchAllPokemon = fetchAllPokemon;

    const root = document.getElementById('root');

    ReactDOM.render(<h1 className="leffos">BIG LEFF</h1>, root)
});