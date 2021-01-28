import React from 'react';
import ReactDOM from 'react-dom';
import { receiveTodo, receiveTodos, removeTodo } from './actions/todo_actions';
import { receiveStep, receiveSteps, removeStep } from './actions/step_actions';
import configureStore from './store/store';


const store = configureStore();

document.addEventListener('DOMContentLoaded', () => {
    window.store = store;
    window.receiveTodo = receiveTodo;
    window.receiveTodos = receiveTodos;
    window.removeTodo = removeTodo;
    window.receiveStep = receiveStep;
    window.receiveSteps = receiveSteps;
    window.removeStep = removeStep;

    const reactRoot = document.getElementById('react-root');
    ReactDOM.render(<h1>To-Do's App</h1>, reactRoot);
})