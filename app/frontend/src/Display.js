import React from 'react';
import Photo from './Photo';

export default class Display extends React.Component {
    
    render() {
        let images = this.props.images.map(image => {
			return <Photo image={image} /> ;
		});
        return (
            <div className="container">
                {images}
            </div>
        );
    }
}