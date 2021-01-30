import React from 'react';
import { TodoListItem } from '../todo_list/todo_list_item'


export const TodoList = (props) => {
    return (
        <div>
            <h1>To-Do's List</h1>
            <ul>
                {props.todos.map((todo) => {
                    return ( 
                        <TodoListItem key={todo.id} todo={todo}/>
                    )
                })}
            </ul>
        </div>
    )
}
