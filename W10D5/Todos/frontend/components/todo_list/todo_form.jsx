import React from 'react';

class TodoForm extends React.Component {
    constructor(props) {
        super(props)

        this.state = { title: '' }
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleSubmit(e) {
        e.preventDefault();

        this.props.receiveTodo(this.state);

        this.setState({ 
            id: Math.floor(Math.random()) * 10000000000,
            title: ''
        });
    }

    render() {
        return (
            <form onSubmit={this.handleSubmit}>

                <h1>Add a To-Do</h1>

                <label>Title
                    <input type="text" value={this.state.title}/>
                </label>

                <input type="submit" value="Add To-Do"/>
            </form>
        )
    }
}


export default TodoForm;