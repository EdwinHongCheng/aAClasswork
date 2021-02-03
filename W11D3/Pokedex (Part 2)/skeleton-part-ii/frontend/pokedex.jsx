import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

import * as APIUtils from './util/api_util';



document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById("root");
  const store = configureStore();
  const json  = APIUtils.fetchAllPokemon();
  window.json = json;
  ReactDOM.render(<Root store={store} />, rootEl)
})