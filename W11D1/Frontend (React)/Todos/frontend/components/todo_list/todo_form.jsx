import React from 'react';

class TodoForm extends React.Component {
    constructor(props) {
        super(props)

        this.state = { 
            title: '',
            body: '',
            id: Math.floor(Math.random() * 10000000000)
        }

        this.handleSubmit = this.handleSubmit.bind(this);
        this.updateTitle = this.updateTitle.bind(this);
        this.updateBody = this.updateBody.bind(this);
    }

    handleSubmit(e) {
        e.preventDefault();

        this.props.receiveTodo(this.state);

        this.setState({ 
            id: Math.floor(Math.random() * 10000000000),
            title: '',
            body: ''
        });
    }

    updateTitle(e) {
        this.setState({ 
            title: e.target.value,
        });
    }

    updateBody(e) {
        this.setState({
            body: e.target.value,
        });
    }

    render() {
        return (
            <form onSubmit={this.handleSubmit}>

                <h2>Add a To-Do</h2>

                <label>Title
                    <input onChange={ this.updateTitle } type="text" value={this.state.title}/>
                </label>
                <br/>
                <label>Body
                    <input onChange={this.updateBody} type="text" value={this.state.body} />
                </label>
                <br/>
                <input type="submit" value="Add To-Do"/>
            </form>
        )
    }
}


export default TodoForm;