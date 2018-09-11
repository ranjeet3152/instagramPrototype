import React, { Component } from 'react';
import Display from './Display';
import axios from 'axios';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
        images : []
    };
}
  componentDidMount() {
    axios.get('http://localhost:3001/image/fetch_all_images')
    .then(response => {
        console.log(response)
        this.setState({
            images: response.data
        })
    })
    .catch(error => console.log(error))
}
  render() {
    return (
      <Display images={this.state.images}/>
    );
  }
}

export default App;
