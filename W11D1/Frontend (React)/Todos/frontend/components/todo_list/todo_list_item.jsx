import React from 'react';

export const TodoListItem = (props) => {

    return (
        <li>
            <p>{props.todo.title}</p>
            <p>{props.todo.body}</p>
        </li>
    )
}