import React from 'react';

class Weather extends React.Component{

  render(){
    return (
      <h1 id="weather-header">
        <div id="cool-weather">Hello Weather!</div>
      </h1>
    )
  }

  // api.openweathermap.org/data/2.5 / weather ? q = { city name } & appid={ API key }
}

export default Weather;