import React from 'react';
import ReactDOM from 'react-dom';
import { receiveTodo, receiveTodos, removeTodo } from './actions/todo_actions';
import { receiveStep, receiveSteps, removeStep } from './actions/step_actions';
import configureStore from './store/store';
import Root from './components/root';
import { allTodos } from './reducers/selectors'

document.addEventListener('DOMContentLoaded', () => {

    const store = configureStore({});

    window.store = store;
    window.receiveTodo = receiveTodo;
    window.receiveTodos = receiveTodos;
    window.removeTodo = removeTodo;
    window.receiveStep = receiveStep;
    window.receiveSteps = receiveSteps;
    window.removeStep = removeStep;
    window.allTodos = allTodos;



    const reactRoot = document.getElementById('react-root');
    ReactDOM.render(<Root store={store} />, reactRoot);
})