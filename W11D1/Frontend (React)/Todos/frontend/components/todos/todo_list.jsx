import React from 'react';
import { TodoListItem } from '../todo_list/todo_list_item';
import TodoForm from '../todo_list/todo_form';


export const TodoList = (props) => {
    return (
        <div>
            
            <h2>To-Do's List</h2>
            <ul>
                {props.todos.map((todo) => {
                    return ( 
                        <TodoListItem key={todo.id} todo={todo}/>
                    )
                })}
            </ul>

            <TodoForm receiveTodo={props.receiveTodo} />
        </div>
    )
}
