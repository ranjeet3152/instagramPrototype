import React from 'react';

export default class Photo extends React.Component {
    render() {
        console.log(this.props.image.path)
        return (
            <div>
                <img className="img-responsive center-block" src={"localhost:3001" + this.props.image.path} alt="hi" width="600"/>
                <p className="text-center">{this.props.image.caption}</p>
            </div>
        );
        
    }
}