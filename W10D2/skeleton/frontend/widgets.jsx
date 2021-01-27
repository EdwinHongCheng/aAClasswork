import React from 'react';
import ReactDOM from 'react-dom';

import Clock from './clock';
import Tabs from './tabs';
import Weather from './weather';

function Root() {
    return (
        <div>
            <Clock />
            <Weather />
        </div>
    );
}

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");
    ReactDOM.render(<Root />, root);
});


console.log("Webpack is running!");